#!/usr/bin/env bash

THEME_DIR="$HOME/.themes"
CONFIG_DIR="$HOME/.config"

themes=()

for dir in "$THEME_DIR"/*/; do
    themes+=( "$(basename "$dir")" )
done

selected=$(printf "%s\n" "${themes[@]}" | rofi -dmenu -p "Select Theme")

[[ -z "$selected" ]] && exit 1

found=false
for item in "${themes[@]}"; do
    [[ "$item" == "$selected" ]] && found=true && break
done

[[ "$found" == false ]] && exit 1


cp "$THEME_DIR/$selected/kitty.conf" "$CONFIG_DIR/kitty/theme.conf"
cp "$THEME_DIR/$selected/nvim.lua" "$CONFIG_DIR/nvim/lua/matt/colour.lua"

wallpaper="$(random-file.sh "$THEME_DIR/$selected/wallpapers")"

set-wallpaper.sh "$wallpaper"

pgrep -x kitty | xargs -r kill -SIGUSR1

