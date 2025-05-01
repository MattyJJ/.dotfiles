#!/usr/bin/env bash

sudo DEBIAN_FRONTEND=noninteractive apt-get -y install cmake g++ pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3

~/.cargo/bin/cargo install alacritty
