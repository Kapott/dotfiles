#!/bin/bash

command -v stow > /dev/null 2>&1 || { echo >&2 "This installer requires GNU Stow to be installed!"; exit 1;}

PACKAGES=("bash" "xorg" "git" "vim" "tmux" "i3" "curl")
for p in "${PACKAGES[@]}"
do
	stow ${p}
done

if [ ! -d "$HOME/.fonts" ]; then
	mkdir -p $HOME/.fonts
fi

# Get the "Hack" font from github
wget -O $HOME/.fonts/Hack-Regular.ttf https://raw.githubusercontent.com/source-foundry/Hack/master/build/ttf/Hack-Regular.ttf
wget -O $HOME/.fonts/Hack-Bold.ttf https://raw.githubusercontent.com/source-foundry/Hack/master/build/ttf/Hack-Bold.ttf
wget -O $HOME/.fonts/Hack-Italic.ttf https://raw.githubusercontent.com/source-foundry/Hack/master/build/ttf/Hack-Italic.ttf
wget -O $HOME/.fonts/Hack-BoldItalic.ttf https://raw.githubusercontent.com/source-foundry/Hack/master/build/ttf/Hack-BoldItalic.ttf
fc-cache
