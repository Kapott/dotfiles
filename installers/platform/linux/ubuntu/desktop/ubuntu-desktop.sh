#!/usr/bin/env bash

printf "\n[+] Installing ubuntu desktop...\n\n"

# Add repo's for hopelessly outdated stuff
sudo apt-add-repository -y ppa:fish-shell/release-3

sudo apt-get install -y \
	ffmpeg \
	flameshot \
	fish \
	fonts-font-awesome \
	fonts-terminus \
	imagemagick \
	p7zip-full \
	rofi \
	neovim \
	xclip \
	xsel

# Set fish as our default shell
grep -q "fish" /etc/shells || ( sudo echo $(command -v fish) >> /etc/shells )
sudo chsh -s $(command -v fish) $USER

# Remove some default files so stow doesn't complain..
printf "%s\0" .bashrc .config/fish/config.fish .vimrc .vim/bundle | xargs -0 -I{} rm -rf $HOME/{}
vim +PluginInstall +qall

# Install fish plugins
fish -c 'curl -sL https://git.io/fisher | source &&
  fisher install jorgebucaran/fisher &&
  fisher install PatrickF1/fzf.fish &&
  fisher install jethrokuan/z &&
  fisher install jorgebucaran/hydro'

