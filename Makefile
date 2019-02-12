
dotfiles:
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

i3:
	test -d ${HOME}/.i3 || mkdir -p ${HOME}/.i3
	test -L ${HOME}/.i3/config || mv ${HOME}/.i3/config ${HOME}/.i3/config_old
	ln -vsfn ${PWD}/i3/.i3/config ${HOME}/.i3/config
	ln -vsfn ${PWD}/i3/.i3status.conf ${HOME}/.i3status.conf

scripts:
	mkdir -p ${HOME}/bin

nvm:
	curl -

ubuntu:
	sudo apt update && sudo apt install \
		bash vim curl ffmpeg git stow tmux
