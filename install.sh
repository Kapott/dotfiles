#!/usr/bin/env bash
main () {
	local platform git_root

	# Check which platform we're currently running
	platform=$(command uname | tr '[:upper:]' '[:lower:]')

	# Optionally execute an installer for this platform
	if test -f "$HOME/.installed"; then
		read -p "An existing installation was detected. Reinstall? " -n 1 -r
		if [[ ! $REPLY =~ ^[Yy]$ ]]; then
			exit 1
		fi
	fi

	printf "\n"
	test -f "$HOME/.installed" && rm "$HOME/.installed"
	printf "[+]\tInstalling on platform: %s..\n\n" "${platform}"
	test -f "installers/platform/${platform}/${platform}.sh" && source "installers/platform/${platform}/${platform}.sh"



	# Make sure we're at the root of our project
	git_root=$(git rev-parse --show-toplevel)
	cd "${git_root}"

	# Change some tokens, depending on the OS we're on.
	case $platform in
		"linux")
			helper="/usr/share/doc/git/contrib/credential/libsecret/git-credential-libsecret"
			;;
		"darwin")
			helper="osxkeychain"
			;;
		*)
			helper="store"
			;;
	esac	

	# Install all of the dotfiles we know of for this platform
	pushd "${platform}"
	sed -E "s|helper = .*|helper = ${helper}|" ../common/git/dot-gitconfig > ../common/git/dot-gitconfig2
	mv -f ../common/git/dot-gitconfig2 ../common/git/dot-gitconfig
	stow --dotfiles -vRt "$HOME" * && \
		stow -vRt "$HOME" fish && \
		touch "$HOME/.installed" && \
		vim +PluginInstall +qall
	popd

	# Install fish plugins
	fish -c 'curl -sL https://git.io/fisher | source &&
	  fisher install jorgebucaran/fisher &&
	  fisher install PatrickF1/fzf.fish &&
	  fisher install jethrokuan/z &&
	  fisher install jorgebucaran/hydro'

	printf "\n\n[+]\tDone!\n\n"
}

main "$@"
