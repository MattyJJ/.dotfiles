#!/usr/bin/env bash

cmd="$1"
shift

pgrep -x "$cmd" > /dev/null || "$cmd" "$@" &
