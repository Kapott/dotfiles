#!/bin/bash

INSTALL_DIR="$HOME/.config"
SYMLINK_FILES=('.vimrc','.tmux.conf','.gitconfig','bashrc')

for fileName in "${SYMLINK_FILES[@]}"
do
  local full_path="${INSTALL_DIR}/${fileName}"
  local this_path="${PWD}/${fileName}"
  if [ -e ${full_path} ]; then
    printf "There is already a file or symlink in %s!\n" "$full_path"
    exit 1;
  elif [ ! -e ${this_path} ]; then
    printf "Could not find file: %s" "$this_path"
    exit 1;
  elif [ -e ${this_path} ] && [ ! -e ${full_path} ]; then
    ln -s ${this_path} ${full_path} && printf "Linking: %s => %s" "$this_path" "$full_path"
  fi
done

