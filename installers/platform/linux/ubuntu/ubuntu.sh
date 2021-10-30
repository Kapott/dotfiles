#!/usr/bin/env bash

# Install packages I want on Ubuntu desktop and server.
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

type Xorg || source server/ubuntu-server.sh
type Xorg && source desktop/ubuntu-desktop.sh
