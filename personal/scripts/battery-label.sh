#!/usr/bin/env bash

[ $(platform.sh) != "laptop" ] && exit 0

icon=$(battery-icon.sh)
percent=$(battery-percentage.sh)

echo "$icon $percent%"

