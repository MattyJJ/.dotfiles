#!/usr/bin/env bash

THEME_DIR="$HOME/.themes"
CONFIG_DIR="$HOME/.config"

themes=()

for dir in "$THEME_DIR"/*/; do
    themes+=( "$(basename "$dir")" )
done

selected=$(printf "%s\n" "${themes[@]}" | rofi -dmenu -p "Select Theme")

if [[ ! " ${themes[@]} " =~ " ${selected} " ]]; then
    exit 1
fi

if [[ -z "$selected" ]]; then
    exit 1
fi

cp "$THEME_DIR/$selected/kitty.conf" "$CONFIG_DIR/kitty/theme.conf"
cp "$THEME_DIR/$selected/nvim.lua" "$CONFIG_DIR/nvim/lua/matt/colour.lua"

wallpaper="$(random-file.sh "$THEME_DIR/$selected/wallpapers")"

set-wallpaper.sh $wallpaper

kill -SIGUSR1 $(pgrep -x kitty)
