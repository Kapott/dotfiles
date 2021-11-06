#!/usr/bin/env bash

# Install packages I want on Ubuntu desktop and server.
sudo apt-get update && sudo apt-get install -y \
 bat \
 build-essential \
 curl \
 exa \
 fd-find \
 fzf \
 git \
 pigz \
 ripgrep \
 tmux \
 stow

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
echo ${SCRIPT_DIR}/server/ubuntu-server.sh

if [ -z "${DISPLAY}" ]; then
	test -f "${SCRIPT_DIR}/server/ubuntu-server.sh" && source "${SCRIPT_DIR}/server/ubuntu-server.sh"
else
	test -f "${SCRIPT_DIR}/desktop/ubuntu-desktop.sh" && source "${SCRIPT_DIR}/desktop/ubuntu-desktop.sh"
fi
