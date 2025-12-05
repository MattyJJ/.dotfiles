#!/usr/bin/env bash

if [ "$EUID" -eq 0 ]; then
    echo "Do NOT run this script as root."
    exit 1
fi
mkdir "$HOME/.config" 2>/dev/null

rm -rf "$HOME/.config/hypr"
rm -rf "$HOME/.config/mako"
rm -rf "$HOME/.config/nvim"
rm -rf "$HOME/.config/rofi"
rm -rf "$HOME/.config/kitty"
rm -rf "$HOME/.config/waybar"
rm -rf "$HOME/.config/wlogout"
rm -rf "$HOME/.config/fastfetch"
rm "$HOME/.config/starship.toml"

stow -D -t ~ .
stow -t ~ .

