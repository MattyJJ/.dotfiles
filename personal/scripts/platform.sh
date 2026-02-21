#!/usr/bin/env bash

if [ -d "/sys/class/power_supply/BAT0" ] || ls /sys/class/power_supply/ | grep -q BAT; then
    echo "laptop"
    exit 0
fi

echo "desktop"
