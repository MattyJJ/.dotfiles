#!/usr/bin/env bash
set -e

echo "This will install packages from packages.txt using pacman."
read -n 1 -p "Continue? [y/N] " answer
echo

if [[ ! "$answer" =~ [yY] ]]; then
    echo "Aborted."
    exit 0
fi

sudo -v

while true; do sudo -v; sleep 60; done 2>/dev/null &

echo "Updating system..."
sudo pacman -Syu --noconfirm

echo "Installing packages..."
sudo pacman -S --needed --noconfirm - < packages.txt

echo "Done."

