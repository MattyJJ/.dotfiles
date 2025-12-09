#!/usr/bin/env bash

[ "$PLATFORM" != "laptop" ] && exit 0
[ ! -d /sys/class/power_supply/BAT0 ] && exit 0

icon=$(battery-icon.sh)
percent=$(battery-percentage.sh)

echo "$icon $percent%"

