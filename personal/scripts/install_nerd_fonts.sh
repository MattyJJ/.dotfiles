#!/usr/bin/env bash
set -e

if ! command -v git &> /dev/null; then
    echo "git is not installed, installing now..."
    sudo pacman -S --needed git
fi

git clone https://github.com/ryanoasis/nerd-fonts.git ~/.nerd-fonts --depth=1

cd ~/.nerd-fonts && ./install.sh
