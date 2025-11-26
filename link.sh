#!/usr/bin/env bash

if [ "$EUID" -eq 0 ]; then
    echo "Do NOT run this script as root."
    exit 1
fi


echo "Creating directories..."

mkdir ~/.config &> /dev/null
mkdir ~/personal &> /dev/null
mkdir ~/personal/scripts/ &> /dev/null
mkdir ~/personal/wallpapers &> /dev/null

echo "Linking dotfiles..."

stow . 2> /dev/null

echo "Done."
