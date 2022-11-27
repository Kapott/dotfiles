#!/usr/bin/env bash

# Install packages I want on Pop desktop.
sudo apt-get update && sudo apt-get install -y \
 stow \
 bat \
 build-essential \
 curl \
 fd-find \
 fzf \
 git \
 pigz \
 ripgrep \
 tmux \
 seahorse

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

test -f "${SCRIPT_DIR}/desktop/pop-desktop.sh" && source "${SCRIPT_DIR}/desktop/pop-desktop.sh"
