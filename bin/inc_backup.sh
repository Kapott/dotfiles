#!/bin/bash

# Set it up creating an empty $TARGET and symlink a dummy $TARGET/latest to it. Populate
# /etc/backup/rsync.exclude with lost+found, tmp, var/run and everything else you need to skip
# during backup, or go for --include-from if it fits you better; man rsync is your friend.
# Proper sanity checks, error control, remote backup and pretty GNOME GUI are left as an exercise
# to the reader ;-)

command -v rsync >/dev/null 2>&1 || { echo >&2 "I require rsync but it's not installed.  Aborting."; exit 1; }

DATE=`/bin/date +%Y%m%d%H%M%S`
RSYNC=$(command -v rsync)
BASE=/mnt/externalhd
TARGET=$BASE/daily
$RSYNC -av --exclude $TARGET --exclude-from=/etc/backup/rsync.exclude --link-dest=$TARGET/latest/ / $TARGET/$DATE/
touch $TARGET/$DATE/
rm $TARGET/latest
ln -s $TARGET/$DATE $TARGET/latest
