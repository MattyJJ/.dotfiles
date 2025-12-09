#!/usr/bin/env bash

[ "$PLATFORM" != "laptop" ] && exit 0
[ ! -d /sys/class/power_supply/BAT0 ] && exit 0

battery="/sys/class/power_supply/BAT0"
message=""

if [ -d $battery ]; then
    status=$(cat $battery/status)
    message="$status"
else
    message="No battery"
fi

echo "$message"

