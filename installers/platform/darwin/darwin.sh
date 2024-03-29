#!/usr/bin/env bash

if [[ $(command -v brew) == "" ]]; then
	echo "Installing homebrew..."
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
	printf "%s" "Homebrew is already installed."
fi

# Install brew packages
echo "ripgrep exa bat jq fd coreutils findutils stow fish curl git tree" | xargs -n1 brew install

# Set fish as our default shell
grep -q "fish" /etc/shells || ( sudo echo $(command -v fish) >> /etc/shells )
sudo chsh -s $(command -v fish) $USER
