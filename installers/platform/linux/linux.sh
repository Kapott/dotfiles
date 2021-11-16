#!/usr/bin/env

test -f /etc/os-release && source /etc/os-release
mkdir -p $HOME/.ssh

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
test -n "$ID" && source "${SCRIPT_DIR}/${ID}/${ID}.sh"
