#!/usr/bin/env bash

if [ -z "$force" ]; then
  [ -d /opt/nvim ] && return
fi

curl -L https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz | tar -xz

sudo mv nvim-linux-x86_64 /opt/nvim
sudo ln -sf /opt/nvim/bin/nvim /usr/local/bin/nvim
