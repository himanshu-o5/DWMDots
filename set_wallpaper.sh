#!/bin/bash

WALLPAPER_DIRECTORY=~/.config/wallpapers


RANDOM_WALLPAPER=$(find $WALLPAPER_DIRECTORY -type f -name "*.jpg" -o -name "*.png" | shuf -n 1)


feh --bg-scale $RANDOM_WALLPAPER
wal -i $RANDOM_WALLPAPER
xdotool key super+F5
