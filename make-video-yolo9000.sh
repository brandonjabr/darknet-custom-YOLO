if [ $# -eq 0 ]
  then
    echo "No input video specified. Usage: ./video-yolo9000.sh INPUT_VIDEO.mp4 "
    exit
fi
./darknet detector demo cfg/combine9k.data cfg/yolo9000.cfg weights/yolo9000.weights -prefix output $1 -thresh 0.25

# Generate labelled video from generated images.
FRAMERATE=ffmpeg -i $1 2>&1 | sed -n "s/.*, \(.*\) fp.*/\1/p"
ffmpeg -framerate $FRAMERATE -i output_%08d.jpg output.mp4

# Get audio from original video and map to output video
ffmpeg -i $1 -map 0:a audio.aac -map 0:v onlyvideo.mp4
ffmpeg -i output.mp4 -i audio.aac -codec copy -shortest results.mp4

rm -f onlyvideo.mp4
rm -f output_*.jpg
open results.mp4
