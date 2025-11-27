#!/usr/bin/env bash

wallpaper=$(find "$HOME/personal/wallpapers/$1/" -type f | shuf -n 1)

[ -z "$wallpaper" ] && echo "No wallpapers found!" && exit 1

echo $wallpaper
