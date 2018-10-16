#!/bin/bash

command -v stow > /dev/null 2>&1 || { echo >&2 "This installer requires GNU Stow to be installed!"; exit 1;}

PACKAGES=("bash" "xorg" "git" "vim" "tmux" "i3" "curl")
for p in "${PACKAGES[@]}"
do
	stow ${p}
done
