#!/usr/bin/env bash

###
# Prints the index number, followed by the value of the file's first
# line. This means that CSV's with headers create a nice list and CSV
# files without headers are easier to flesh out.
###

main() {
  local file=$(check_args "$@")
  [[ $file == "1" ]] \
	  && echo "Could not find input file, or file does not exist" \
	  && exit 1

  csv_header=$(head -n 1 "${1}")
  IFS=',' read -r -a array <<< "$csv_header"

  for index in "${!array[@]}"; do
    printf "%s\t%s\n" "$index" "${array[index]}"
  done
}


check_args() {
	[[ ! -z $1 ]] && [[ -f "$1" ]] && echo "0" || echo "1"
}

main "$@"
