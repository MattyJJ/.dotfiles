#!/usr/bin/env bash

[ $(platform.sh) != "laptop" ] && exit 0

battery="/sys/class/power_supply/BAT0"
message=""

if [ -d $battery ]; then
    status=$(cat $battery/status)
    message="$status"
else
    message="No battery"
fi

echo "$message"

