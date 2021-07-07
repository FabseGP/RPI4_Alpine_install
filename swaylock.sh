#cs!/bin/bash

echo begining of the script

image="/tmp/swaylockscreen.jpeg"

grim -t jpeg -q 1 $image && ffmpeg -i $image -filter_complex boxblur=lr=5:lp=2 -y $image

swaylock -i "$image" -n
