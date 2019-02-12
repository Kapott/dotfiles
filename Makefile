SHELL := /bin/bash

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
	# Xorg settings
	ln -vsfn ${PWD}/xorg/.Xmodmap ${HOME}/.Xmodmap # remaps capslock and escape
	# Misc
	ln -vsfn ${PWD}/git/.gitconfig ${HOME}/.gitconfig
	ln -vsfn ${PWD}/curl/.curlrc ${HOME}/.curlrc

scripts:
	rsync -avh ${PWD}/bin/* ${HOME}/bin

ubuntu:
	sudo apt update && sudo apt install -y \
		bash vim curl git tmux build-essential ffmpeg youtube-dl python3-pip python3-venv \
		libssl-dev pigz

yarn:
	curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
	echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
	sudo apt-get update && sudo apt-get install --no-install-recommends yarn

nvm:
	mkdir -p ${HOME}/.nvm
	curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

i3:
	test -d ${HOME}/.i3 || mkdir -p ${HOME}/.i3
	test -L ${HOME}/.i3/config || mv ${HOME}/.i3/config ${HOME}/.i3/config_old
	ln -vsfn ${PWD}/i3/.i3/config ${HOME}/.i3/config
	ln -vsfn ${PWD}/i3/.i3status.conf ${HOME}/.i3status.conf

