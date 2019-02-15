#!/bin/bash

function command_exists {
  type "$1" &> /dev/null
}

export NC='\033[0m' # No color
export RED='\033[31m'
export GREEN='\033[32m'

function check_process {
  out=`ps aux | grep $1 | grep -v grep`
  if [[ $out = *"$1"* ]]; then
    echo -e "${GREEN}OK${NC}: $1 is running"
  else
    echo -e "${RED}NOK${NC}: $1 not running"
  fi
}

function gpg_agent_start {
  check_process gpg-agent | grep 'KO' &> /dev/null
  if [ $? == 0 ]; then
    gpg-agent --daemon
    check_process gpg-agent
  fi
}

# Wrap the man command so it also works for bash built-ins, like
# 'cd' and 'command'.
function man () {
    case "$(type -t -- "$1")" in
    builtin|keyword)
        help -m "$1" | sensible-pager
        ;;
    *)
        command man "$@"
        ;;
    esac
}
