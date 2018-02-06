# Generates 2000 characters from dad's model
./darknet rnn generate cfg/rnn.cfg backup/dad.weights -len 2000

# RNN Training
./darknet rnn train cfg/rnn.train.cfg backup/rnn.backup -file texts-data/Dad/texts-Dad.txt
