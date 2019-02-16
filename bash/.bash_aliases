#!/bin/bash

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias -- -="cd -"

alias cputop="ps aux | sort -nr -k 3 | tr -s ' ' | cut -d ' ' -f 1,2,3,11 | head -n 10"
alias d="cd ${HOME}/Documents"
alias dl="cd ${HOME}/Downloads"
alias dt="cd ${HOME}/Desktop"
alias g="git"
alias genpass="command -v openssl >/dev/null 2>&1 && openssl rand -base64 25 | sed 's/..$//'"
alias h="history | grep " # e.g. h docker, then !123 to execute history
alias ipx="curl ipinfo.io/ip" # Get external ip address
alias l="ls -lAF" # Full, colorized listing
alias ll=l
alias lsl="ls -laF | grep '\->'" # show only symlinks
alias ls="command ls --color"   # 'command' to use the 'real' ls instead of aliases
alias lsd="ls -lF --color | grep --color=never '^d'" # List directories only
alias memtop="ps aux | sort -nr -k 4 | tr -s ' ' | cut -d ' ' -f 1,2,4,11 | head -n 10"
alias mkdir="command mkdir -pv "
alias mus="cd ${HOME}/Music"
alias r="ranger"
alias sv="sudo vim"
alias sr="sudo ranger"
alias t="tmux a || tmux" # Open tmux, or attach to disconnected sess
alias untar="tar -zxvf "
alias upg="sudo apt update && sudo apt upgrade -y" # upgrade system
alias v="vim"
alias w="cd ${HOME}/work"
alias week="date +%V" # get weeknumber
alias yt="youtube-dl --add-metadata -ic" # Download video link
alias yta="yt -x -f bestaudio/best" # Download only audio
