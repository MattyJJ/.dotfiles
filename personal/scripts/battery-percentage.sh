#!/usr/bin/env bash

battery="/sys/class/power_supply/BAT0"
message=""

if [ -d $battery ]; then
    capacity=$(cat $battery/capacity)
    message="$capacity"
else
    message="No battery"
fi

echo "$message"

