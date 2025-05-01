#!/usr/bin/env bash

while getopts ":f" flag; do
  case "$flag" in
    f) force=true ;;
  esac
done

sudo DEBIAN_FRONTEND=noninteractive apt-get -y update
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install

source other/install_tools.sh

source languages/install_cxx.sh
source other/install_libs.sh

source apps/install_generic.sh
source apps/install_alacritty.sh
source apps/install_docker.sh
source apps/install_neovim.sh
source apps/install_zsh.sh

source other/install_asdf.sh
