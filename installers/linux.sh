#!/usr/bin/env

test -f /etc/os-release && source /etc/os-release
test -n "$ID" && source "install-${ID}.sh"


