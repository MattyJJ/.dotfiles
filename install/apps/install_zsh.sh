#!/usr/bin/env bash

if [ -z "$force" ]; then
  [ -d "~/.local/share/zinit" ] && return
fi

sudo DEBIAN_FRONTEND=noninteractive apt-get install -y  zsh

chsh -s $(which zsh)
