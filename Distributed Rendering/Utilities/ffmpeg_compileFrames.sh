#!/bin/bash

usage(){
	echo "Usage: ffmpeg_compileFrames.sh <frame directory> <file format> <framerate>"
}

cd "$1"
dirName=$(basename "$1")

pwd
echo "ffmpeg -hide_banner -i $2 -framerate $3 ${dirName}.mp4"

ffmpeg -hide_banner -framerate $3 -i $2 -c:v libx264 -vf "fps=$3" -y ${dirName}.mp4
