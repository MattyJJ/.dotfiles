#!/bin/sh

battery="/sys/class/power_supply/BAT0"
message=""

if [ -d $battery ]; then
    status=$(cat $battery/status)
    message="$status"
else
    message=""
fi

case "$message" in
  Charging)    echo '+' ;;
  Discharging) echo '-' ;;
  "Not Charging"|"Not charging") echo '/' ;;
  *)           echo '/' ;;
esac
