#!/usr/bin/env bash

[ $(platform.sh) != "laptop" ] && exit 0

battery="/sys/class/power_supply/BAT0"

case "$(cat $battery/status)" in
  Charging)    echo '+' ;;
  Discharging) echo '-' ;;
  "Not Charging"|"Not charging") echo '/' ;;
  *)           echo '/' ;;
esac
