#!/usr/bin/env bash

if [ "$EUID" -eq 0 ]; then
    echo "Do NOT run this script as root."
    exit 1
fi

./link.sh
sudo pacman -Syu $(cat packages.txt) --noconfirm
