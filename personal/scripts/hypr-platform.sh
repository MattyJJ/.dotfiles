#!/usr/bin/env bash

source ~/.zshenv

if [[ "$PLATFORM" == "laptop" ]]; then
    cp ~/.config/hypr/modules/platform/laptop.conf ~/.config/hypr/modules/platform.conf
elif [[ "$PLATFORM" == "desktop" ]]; then
    cp ~/.config/hypr/modules/platform/desktop.conf ~/.config/hypr/modules/platform.conf
fi

hyprctl reload
