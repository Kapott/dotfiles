#!/bin/bash
#
# datetag.sh
# Usage: datetag.sh <filename>
#
# Will rename a file, and prepend yyyyMMdd_ in front of the filename where the date will be the last
# modified timestamp of that file.
;
# eg testfile.txt with a last modified timestamp of september 1st, 2018
# will become 20180901_testfile.txt

mod_date="$(stat -c %y ${1} | awk '{print $1}')"
mv ${1} ${mod_date}_${1}
