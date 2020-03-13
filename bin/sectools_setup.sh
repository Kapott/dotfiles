#!/usr/bin/env bash
installing() {
	printf "%s: %s...\n" "Installing" "${1}"
}

download_archive() {
	tempfile=$(mktemp)
	wget --max-redirect 2 -O "${tempfile}" "${1}"
	printf "%s" "${tempfile}" 
}

filename_from_url() {
	url="${1}"
	filetype=$(echo "$url" | rev | cut -d'/' -f1 | rev)
	printf "%s" "${filetype}"
}

# extract original_filename downloaded_filename
extract() {
	tempdir=$(mktemp -d)
	filename_from_url="${1}"
	tempfile="${2}"
	case "${filename_from_url}" in
		*.tar.gz)
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
			printf "%s\n" "Impossibru!!1"
		;;
	esac
	printf "%s" "${tempdir}" #return where the extracted files are
}

# usage 'magic https://my.url/filename.ext'
get_and_extract() {
	local tempfile origfile outputdir
	tempfile=$(download_archive "${1}")
	origfile=$(filename_from_url "${1}")
	outputdir=$(extract "${origfile}" "${tempfile}")
	printf "%s" "${outputdir}"
}

download() {
	local tempdir
	tempdir=$(get_and_extract "${1}")
	printf "%s" "${tempdir}"
}

# get ffuf
ffuf() {
	local url tempdir
	url='https://github.com/ffuf/ffuf/releases/download/v1.0.2/ffuf_1.0.2_linux_amd64.tar.gz'
	tempdir=$(download "${url}")
	
	#archive specific operations
	mv "${tempdir}/ffuf" "${HOME}/bin/"

	#cleanup
	rm -rf "${tempdir}/"
}

# get gobuster
gobuster() {
	local url tempdir
	url='https://github.com/OJ/gobuster/releases/download/v3.0.1/gobuster-linux-amd64.7z'
	tempdir=$(download "${url}")
	
	# archive specific operations
	mv "${tempdir}/gobuster-linux-amd64/gobuster" "${HOME}/bin/"
	chmod 700 "${HOME}/bin/gobuster"

	#cleanup
	rm -rf "${tempdir}/"
}

ffuf
gobuster
