#!/bin/sh

current=$(swww query | grep "currently displaying" | cut -d'"' -f2)
path=~/Pictures/

while true; do
    wallpaper=$(find $path -type f | shuf --random-source=/dev/urandom -n 1)

    if [ "$wallpaper" != "$path$current" ]; then
        swww img "$wallpaper" --transition-fps 60 --transition-type wipe --transition-duration 3
        break
    fi
done
