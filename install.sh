#!/usr/bin/env bash
main () {
	local platform git_root

	# Check which platform we're currently running on, normalize to lowercase.
	platform=$(command uname | tr '[:upper:]' '[:lower:]')

	# Check if we're installing or reinstalling, and only continue with a
	# reinstall if we explicitly type 'y' or 'Y'.
	if test -f "$HOME/.installed"; then
		read -p "An existing installation was detected. Reinstall? " -n 1 -r
		if [[ ! $REPLY =~ ^[Yy]$ ]]; then
			exit 1
		fi
	fi

	# Remove our 'hey, we installed this stuff already' lock file.
	test -f "$HOME/.installed" && rm "$HOME/.installed"

	# Source the appropriate file for the current platform.
	printf "\n[+]\tInstalling on platform: %s..\n\n" "${platform}"
	test -f "installers/platform/${platform}/${platform}.sh" && source "installers/platform/${platform}/${platform}.sh"

	# cd to the root of our project
	git_root=$(git rev-parse --show-toplevel)
	cd "${git_root}"

	# Figure out which git-helper we're going to use later on. This is platform
	# dependant, hence the circus.
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

	# Change working directory to the platform's directoy
	pushd "${platform}"

	# Adjust our gitconfig, plopping in the correct helper.
	sed -E "s|helper = .*|helper = ${helper}|" ../common/git/dot-gitconfig > ../common/git/dot-gitconfig2
	mv -f ../common/git/dot-gitconfig2 ../common/git/dot-gitconfig

	# Tell stow to symlink our dotfiles, and change dot-{file|dir} to .{file|dir}
	# and, if everything is succesful, boot up vim and tell it to install all of
	# our crap.
	stow --dotfiles -vRt "$HOME" * && \
		touch "$HOME/.installed" && \
		vim +PluginInstall +qall

	# Change back directory to what should have been the git root.
	popd
	
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

	printf "\n\n[+]\tDone!\n\n"
}

main "$@"
