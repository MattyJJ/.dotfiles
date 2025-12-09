#!/usr/bin/env bash

[ "$PLATFORM" != "laptop" ] && exit 0
[ ! -d /sys/class/power_supply/BAT0 ] && exit 0

status=$(battery-status.sh)
percent=$(battery-percentage.sh)

icons_default=( "󰂃" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" )
icons_charging=( "󰢜" "󰂆" "󰂇" "󰂈" "󰢝" "󰂉" "󰢞" "󰂊" "󰂋" "󰂅" )

index=$(( percent / 10 ))
if [ $index -gt 9 ]; then
    index=9
fi

if [ "$status" = "Charging" ]; then
    icon=${icons_charging[$index]}
else
    icon=${icons_default[$index]}
fi

echo "$icon"

