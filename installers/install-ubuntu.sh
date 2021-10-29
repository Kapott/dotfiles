#!/usr/bin/env bash

# Install packages common to both the Ubuntu desktop and server.
apt-get update && apt-get install -y \
	bat \ # cat alt
	build-essential \
	curl \
	exa \ # ls alt
	fd-find \ # find alt
	fzf \
	git \
	pigz \
	ripgrep \
	tmux

type Xorg || source install-ubuntu-server.sh
type Xorg && source install-ubuntu-desktop.sh
