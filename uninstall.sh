#!/usr/bin/env bash
main () {
	local platform git_root

	# Check which platform we're currently running
	platform=$(command uname | tr '[:upper:]' '[:lower:]')

	printf "\n"
	printf "[+]\tUnlinking dotfiles. Leaving installed packages.. (%s)\n\n" "${platform}"

	# Make sure we're at the root of our project
	git_root=$(git rev-parse --show-toplevel)
	cd "${git_root}"

	# Install all of the dotfiles we know of for this platform
	pushd "${platform}"
	stow --dotfiles -vDt "$HOME" * && \
		stow -vDt "$HOME" fish && \
		test -f "$HOME/.installed" && rm "$HOME/.installed"
	popd

	printf "\n\n[+]\tDone!\n\n"
}

main "$@"
