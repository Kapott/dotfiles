SHELL := /bin/bash

.PHONY: dotfiles
dotfiles: scripts
	# Vim setup
	test -L ${HOME}/.vimrc || rm -rf ${HOME}/.vimrc
	ln -vsfn ${PWD}/vim/.vimrc ${HOME}/.vimrc

	# Tmux setup
	test -L ${HOME}/.tmux.conf || rm -rf ${HOME}/.tmux.conf
	ln -vsfn ${PWD}/tmux/.tmux.conf ${HOME}/.tmux.conf

	# Bash config,aliases,functions setup
	test -L ${HOME}/.bashrc || mv ${HOME}/.bashrc ${HOME}/.bashrc_old
	ln -vsfn ${PWD}/bash/.bashrc ${HOME}/.bashrc
	ln -vsfn ${PWD}/bash/.bash_aliases ${HOME}/.bash_aliases
	ln -vsfn ${PWD}/bash/.bash_functions ${HOME}/.bash_functions
	ln -vsfn ${PWD}/bash/.bash_extra ${HOME}/.bash_extra
	ln -vsfn ${PWD}/bash/.bash_prompt ${HOME}/.bash_prompt

	# Xorg settings
	ln -vsfn ${PWD}/xorg/.Xmodmap ${HOME}/.Xmodmap # remaps capslock and escape
	ln -vsfn ${PWD}/xorg/.Xresources ${HOME}/.Xresources

	# Misc
	ln -vsfn ${PWD}/git/.gitconfig ${HOME}/.gitconfig
	ln -vsfn ${PWD}/curl/.curlrc ${HOME}/.curlrc

.PHONY: scripts
scripts:
	test -d ${HOME}/bin || mkdir -p ${HOME}/bin
	ln -vsfn ${PWD}/bin/* ${HOME}/bin

.PHONY: ubuntu
ubuntu:
	sudo apt update && sudo apt install -y \
		bash vim-gtk autoconf curl git tmux build-essential ffmpeg youtube-dl \
		python3-pip python3-venv libssl-dev pigz jq ranger meld pkg-config \
		net-tools lm-sensors libsecret-1-0 libsecret-1-dev global p7zip-full \
		peek flameshot scrot xdotool wmctrl fonts-font-awesome rofi
	sudo snap install nmap


.PHONY: fedora
fedora:
	sudo dnf install bash vim feh xdotool fontawesome-fonts rofi terminus-fonts

.PHONY: yarn
yarn:
	# Note that yarn is, atm, debian/ubuntu specific
	curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
	echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
	sudo apt-get update && sudo apt-get install --no-install-recommends yarn

.PHONY: nvm
nvm:
	mkdir -p ${HOME}/.nvm
	curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

.PHONY: i3
i3:
	test -d ${HOME}/.i3 || mkdir -p ${HOME}/.i3
	#test -L ${HOME}/.i3/config || mv ${HOME}/.i3/config ${HOME}/.i3/config_old
	ln -vsfn ${PWD}/i3/.i3/config ${HOME}/.i3/config
	ln -vsfn ${PWD}/i3/.i3status.conf ${HOME}/.i3status.conf
	mkdir -p ${HOME}/.xlock
	ln -vsfn ${PWD}/.xlock/lock.png ${HOME}/.xlock/lock.png
