#!/usr/bin/env bash

themes=("catppuccin" "everforest" "gruvbox")


selected_theme=$(printf "%s\n" "${themes[@]}" | rofi -dmenu -p "Select Theme")

if [[ ! " ${themes[*]} " =~ " ${selected_theme} " ]]; then
    exit 1
fi

[ -z "$selected_theme" ] && exit 0

echo "include themes/$selected_theme.conf" > ~/.config/kitty/theme.conf
echo "vim.cmd(\"colorscheme $selected_theme\")" > ~/.config/nvim/lua/matt/colour.lua

wallpaper=$(find "$HOME/personal/wallpapers/$selected_theme/" -type f | shuf -n 1)

[ -z "$wallpaper" ] && echo "No wallpapers found!" && exit 1

swww img $wallpaper --transition-type none

kill -SIGUSR1 $(pgrep -x kitty)

echo $selected_theme > ~/.current_theme
