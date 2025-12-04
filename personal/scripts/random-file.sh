#!/usr/bin/env bash

file=$(find "$1/" -type f | shuf -n 1)

[ -z "$file" ] && echo "No files found!" && exit 1

echo $file
