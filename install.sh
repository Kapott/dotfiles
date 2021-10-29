#!/usr/bin/env bash
main () {
	local platform git_root

	# Check which platform we're currently running
	platform=$(command uname | tr '[:upper:]' '[:lower:]')

	# Optionally execute an installer for this platform
	if test -f "$HOME/.installed"; then
		read -p "Installation detected. Reinstall? " -n 1 -r
		if [[ ! $REPLY =~ ^[Yy]$ ]]; then
			exit 1
		fi
	fi

	printf "\n"
	test -f "$HOME/.installed" && rm "$HOME/.installed"
	test -f "${platform}.sh" && source "${platform}.sh"

	# Make sure we're at the root of our project
	git_root=$(git rev-parse --show-toplevel)
	cd "${git_root}"

	# Install all of the dotfiles we know of for this platform
	pushd "${platform}"
	stow --dotfiles -nvRt "$HOME" *
	popd

	touch "$HOME/.installed"
}

main "$@"
