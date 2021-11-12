#!/usr/bin/env bash

# Install packages I want on Pop desktop.
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

test -f "${SCRIPT_DIR}/desktop/pop-desktop.sh" && source "${SCRIPT_DIR}/desktop/pop-desktop.sh"
