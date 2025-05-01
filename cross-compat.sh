#!/usr/bin/env bash

find . -type f | while read file; do
  sed -i 's/\r//g' "$file"
done

find . -type f -name "*.sh" -exec chmod +x {} \;
