#!/usr/bin/env bash

printf "\n[+] Installing pop desktop...\n\n"

# Add repo's for hopelessly outdated stuff
sudo apt-add-repository -y ppa:fish-shell/release-3

sudo apt-get install -y \
	ffmpeg \
	flameshot \
	fish \
	fonts-font-awesome \
	fonts-terminus \
	gcc \
	imagemagick \
	libsecret-1-0 \
	libsecret-1-dev \
	make \
	p7zip-full \
	rofi \
	neovim \
	ripgrep \
	seahorse \
	xclip \
	xsel \
	flatpak \
	tree \
	rename

l7t=$(cd /usr/share/doc/git/contrib/credential/libsecret && sudo make)

# Install vim plugin manager
if [ ! -f "$HOME/.vim/bundle/Vundle.vim/.git/config" ]; then
	echo "Vundle not found, cloning..."
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# Set fish as our default shell
grep -q "fish" /etc/shells || ( sudo echo $(command -v fish) >> /etc/shells )
sudo chsh -s $(command -v fish) $USER

# Remove some default files so stow doesn't complain..
printf "%s\0" .bashrc .config/fish/config.fish | xargs -0 -I{} rm -rf $HOME/{}

