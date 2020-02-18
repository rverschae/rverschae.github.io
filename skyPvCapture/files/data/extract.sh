#!/bin/bash
# Extracts frames for the set of videos of given day
# The frames are grouped for each 10-min.

videodate="20161210";

# for each valid video (of 10min data)
for idx in `seq -w 0 1 235  | awk '{if ($1>=0){printf($1"\n")}}' | awk '{if ($1%10 <6){printf($1"\n")}}'`; do
	# make directory to extract frames
	mkdir $videodate-$idx
	# extrant frames
	ffmpeg -i $videodate/$videodate-$idx.mp4 -r 25 -s 5120x1280 -f image2 -qscale:v 2 $videodate-$idx/frame-%0003d.jpeg
done


