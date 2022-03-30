#!/usr/bin/env bash

# Install packages I want on Ubuntu desktop and server.
sudo apt-get update && sudo apt-get install --ignore-missing -y \
 build-essential \
 curl \
 fd-find \
 fzf \
 git \
 pigz \
 ripgrep \
 tmux \
 stow \
 jq

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

if [ -z "${DISPLAY}" ]; then
	echo "-> Ubuntu server"
	test -f "${SCRIPT_DIR}/server/ubuntu-server.sh" && source "${SCRIPT_DIR}/server/ubuntu-server.sh"
else
	echo "-> Ubuntu desktop"
	test -f "${SCRIPT_DIR}/desktop/ubuntu-desktop.sh" && source "${SCRIPT_DIR}/desktop/ubuntu-desktop.sh"
fi
