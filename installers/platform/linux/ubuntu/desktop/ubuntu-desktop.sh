#!/usr/bin/env bash

printf "\n[+] Installing ubuntu desktop...\n\n"

# Add repo's for hopelessly outdated stuff
 
sudo apt-get install -y \
	stow \
	build-essential \
	fd-find \
	fzf \
	pigz \
	ripgrep \
	tmux \
	ffmpeg \
	flameshot \
	flatpak \
	fonts-font-awesome \
	fonts-terminus \
	imagemagick \
	libsecret-1-0 \
	libsecret-1-dev \
	neovim \
	p7zip-full \
	rofi \
	seahorse \
	xclip \
	xsel \
	flatpak \
	tree \
	rename \
	zsh

# Install vim plugin manager
if [ ! -f "$HOME/.vim/bundle/Vundle.vim/.git/config" ]; then
	echo "Vundle not found, cloning..."
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# Remove some default files so stow doesn't complain..
printf "%s\0" .bashrc | xargs -0 -I{} rm -rf $HOME/{}
