#!/usr/bin/env bash

echo "YOU ARE ABOUT TO INSTALL DOTFILES"
echo "THIS WILL DELETE MANY FOLDERS & FILES"
echo "PLEASE ONLY DO ON A NEW MACHINE OR BACKUP YOUR CONFIG FILES"

read -n 1 -p "CONTINUE [y/n] " answer
echo

if [[ ! "$answer" =~ [yY] ]]; then
    exit 0
fi

if [ "$EUID" -eq 0 ]; then
    echo "Do NOT run this script as root."
    exit 1
fi
mkdir "$HOME/.config" 2>/dev/null

rm "$HOME/.tmux.conf"
rm "$HOME/.zsh_aliases"
rm "$HOME/.zshenv"
rm "$HOME/.zshrc"
rm "$HOME/.gitconfig"

rm -rf "$HOME/.config/.themes"
rm -rf "$HOME/.config/fastfetch"
rm -rf "$HOME/.config/hypr"
rm -rf "$HOME/.config/kitty"
rm -rf "$HOME/.config/mako"
rm -rf "$HOME/.config/nvim"
rm -rf "$HOME/.config/rofi"
rm -rf "$HOME/.config/waybar"
rm -rf "$HOME/.config/wlogout"
rm "$HOME/.config/starship.toml"

stow -D -t ~ .
stow -t ~ .

