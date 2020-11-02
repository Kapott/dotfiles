#!/bin/bash

###
# An alias should effectively not (in general) do more than change the default
# options of a command. It is nothing more than simple text replacement on the
# command name. It can't do anything with arguments but pass them to the command
# it actually runs.
###

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias -- -="cd -"

alias d='cd ${HOME}/Documents'
alias dl='cd ${HOME}/Downloads'
alias dt='cd ${HOME}/Desktop'
alias g="git"
alias h="history | grep " # e.g. h docker, then !123 to execute history
alias ipx="curl ipinfo.io/ip" # Get external ip address
alias l="ls -lAF" # Full, colorized listing
alias ll=l
alias ls="command ls --color"   # 'command' to use the 'real' ls instead of aliases
alias lsd="ls -lF --color | grep --color=never '^d'" # List directories only
alias lsds="du -cksh * | sort -hr" # List directories, sorted by dirsize desc
alias lsl="find . -maxdepth 1 -type l -ls" # show only symlinks
alias mkdir="command mkdir -pv "
alias mus='cd ${HOME}/Music'
alias r="ranger"
alias sv="sudo vim"
alias sr="sudo ranger"
alias t="tmux a || tmux" # Open tmux, or attach to disconnected sess
alias til="cd ${HOME}/Work/kapott/til && code ."
alias untar="tar -zxvf "
alias upg="sudo apt update && sudo apt upgrade -y" # upgrade system
alias v="vim"
alias w='cd ${HOME}/work'
alias week="date +%V" # get weeknumber
alias yt="youtube-dl --add-metadata -ic" # Download video link
