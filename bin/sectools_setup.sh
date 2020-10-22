#!/usr/bin/env bash

####################################
# Installs some tools I use often. #
####################################


main() {
	local urls build_from_source i j

	[ ! -d "${HOME}/bin" ] && mkdir -p "${HOME}/bin" && printf "%s\n" "Script had to create ~/bin -- check if it's in your \$PATH"

	urls=( 
		"https://github.com/ffuf/ffuf/releases/download/v1.0.2/ffuf_1.0.2_linux_amd64.tar.gz"
		"https://github.com/OJ/gobuster/releases/download/v3.0.1/gobuster-linux-amd64.7z"
		"https://github.com/tomnomnom/httprobe/releases/download/v0.1.2/httprobe-linux-amd64-0.1.2.tgz"
		"https://github.com/tomnomnom/meg/releases/download/v0.2.4/meg-linux-amd64-0.2.4.tgz"
		"https://github.com/tomnomnom/waybackurls/releases/download/v0.0.2/waybackurls-linux-amd64-0.0.2.tgz"
		"https://github.com/tomnomnom/assetfinder/releases/download/v0.1.0/assetfinder-linux-amd64-0.1.0.tgz"
	)

	build_from_source=(
		"https://github.com/robertdavidgraham/masscan.git"
	)

	lists_git=(
		"https://github.com/danielmiessler/SecLists"
	)

	lists_raw=(
		"https://gist.github.com/jhaddix/f64c97d0863a78454e44c2f7119c2a6a/raw/96f4e51d96b2203f19f6381c8c545b278eaa0837/all.txt"
	)

	printf "%s\n" "Getting and installing tools from:"
	for i in "${urls[@]}"
	do 
		printf "\t-> %s\n" "${i}"
		dl=$(get_and_extract "${i}")
		find "${dl}" -type f -executable -exec mv -t "${HOME}/bin/" {} +
		rm -rf "${dl}"
	done

	printf "%s\n" "Cloning, compiling and installing tools from:"
	for j in "${build_from_source[@]}"
	do
		printf "\t-> %s\n" "${j}"
		tempdir=$(mktemp -d)
		git clone "${j}" "${tempdir}" > /dev/null 2>&1
		(cd "${tempdir}" && make -j > /dev/null 2>&1);
		find "${tempdir}" -type f -executable -size +1M -exec mv -t "${HOME}/bin/" {} +
		rm -rf "${tempdir}"
	done

	printf "%s\n" "Cloning list repositories:"
	mkdir -p $HOME/lists
	for k in "${lists_git[@]}"
	do
		printf "\t-> %s\n" "${k}"
		git clone "${k}" "$HOME/lists" > /dev/null 2>&1
	done

	printf "%s\n" "Grabbing raw txt lists:"
	for l in "${lists_raw[@]}"
	do
		printf "\t-> %s\n" "${l}"
		filename=$(filename_from_url "${l}")
		wget -q --max-redirect 2 -O "$HOME/lists/${filename}" "${l}"

	done
}

download_archive() {
	local tempfile
	
	tempfile=$(mktemp)
	wget -q --max-redirect 2 -O "${tempfile}" "${1}"
	printf "%s" "${tempfile}" 
}

filename_from_url() {
	local url filetype

	url="${1}"
	filetype=$(echo "$url" | rev | cut -d'/' -f1 | rev)
	printf "%s" "${filetype}"
}

# syntax: extract url_with_filname_ext downloaded_tempfile_name
extract() {
	local tempdir filename_from_url tempfile

	tempdir=$(mktemp -d)
	filename_from_url="${1}"
	tempfile="${2}"
	case "${filename_from_url}" in
		*.tar.gz)
			tar -xzvf "${tempfile}" -C "${tempdir}" > /dev/null 2>&1
		;;
		*.tgz)
			tar -xzvf "${tempfile}" -C "${tempdir}" > /dev/null 2>&1
		;;
		*.7z)
			7z x -o"${tempdir}" "${tempfile}" > /dev/null 2>&1
		;;
		*.zip)
			unzip -d "${tempdir}" "${tempfile}" > /dev/null 2>&1
		;;
		*.rar)
			unrar x "${tempfile}" "${tempdir}" > /dev/null 2>&1
		;;
		*)
			printf "%s\n" "Impossibru!!1" #could expand this with a function which uses 'file' to determine filetype.
		;;
	esac
	printf "%s" "${tempdir}" #return where the extracted files are
}

# syntax: get_and_extract url_with_filename_ext
get_and_extract() {
	local tempfile origfile outputdir
	
	tempfile=$(download_archive "${1}")
	origfile=$(filename_from_url "${1}")
	outputdir=$(extract "${origfile}" "${tempfile}")
	printf "%s" "${outputdir}"
}

main
