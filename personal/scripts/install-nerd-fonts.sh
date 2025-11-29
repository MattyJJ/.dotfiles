#!/usr/bin/env bash
set -e

if ! command -v git &> /dev/null; then
    echo "git is not installed, installing now..."
    sudo pacman -S --needed git
fi

if [ ! -d "$HOME/.nerd-fonts" ]; then
    git clone https://github.com/ryanoasis/nerd-fonts.git ~/.nerd-fonts --depth=1
else
    echo "~/.nerd-fonts already exists, pulling latest changes..."
    cd ~/.nerd-fonts
    git pull
fi

cd ~/.nerd-fonts && ./install.sh
