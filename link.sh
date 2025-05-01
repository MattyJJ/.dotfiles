#!/usr/bin/env zsh


pushd $DOTFILES
for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
  [[ "$folder" == "install" ]] && continue
    
  echo "stow $folder"
  stow -D $folder
  stow $folder
done
popd
