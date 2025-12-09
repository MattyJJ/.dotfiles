#!/usr/bin/env bash

if [ ! -f "$HOME/.config/.themes/.current-theme" ]; then
    change-theme.sh gruvbox-dark
fi
