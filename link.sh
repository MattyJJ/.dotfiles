#!/usr/bin/env bash

if [ "$EUID" -eq 0 ]; then
    echo "Do NOT run this script as root."
    exit 1
fi

echo "YOU ARE ABOUT TO INSTALL DOTFILES"
read -n 1 -p "CONTINUE [y/n] " answer
echo

if [[ ! "$answer" =~ [yY] ]]; then
    exit 0
fi

echo

backup() {
    target="$1"
    [ -e "$target" ] && mv "$target" "$target.bak" 
}

mkdir "$HOME/.config" 2>/dev/null

backup "$HOME/.tmux.conf"
backup "$HOME/.zsh_aliases"
backup "$HOME/.zshenv"
backup "$HOME/.zshrc"
backup "$HOME/.gitconfig"

backup -rf "$HOME/.config/.themes"
backup -rf "$HOME/.config/fastfetch"
backup -rf "$HOME/.config/hypr"
backup -rf "$HOME/.config/kitty"
backup -rf "$HOME/.config/mako"
backup -rf "$HOME/.config/nvim"
backup -rf "$HOME/.config/rofi"
backup -rf "$HOME/.config/waybar"
backup -rf "$HOME/.config/wlogout"
backup "$HOME/.config/starship.toml"

stow -D -t ~ .
stow -t ~ .

