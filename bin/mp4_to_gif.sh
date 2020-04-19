#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 [PATH_TO_MP4]"
    exit 1
fi

ffmpeg -y -i $1 -vf fps=20,scale=320:-1:flags=lanczos,palettegen ${1}.palette.png

ffmpeg -y -i $1 -i ${1}.palette.png -filter_complex "fps=20,scale=320:-1:flags=lanczos[x];[x][1:v]paletteuse" ${1}.gif

rm -rf ${1}.palette.png
