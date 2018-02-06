echo "Loading from backup file..."
./darknet detector train cfg/coco.data cfg/yolo.train.cfg backup/yolo.backup weights/darknet19_448.conv.23
