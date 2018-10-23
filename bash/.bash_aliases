#!/bin/bash

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias -- -="cd -"

alias d="cd ~/Documents"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias g="git"
alias l="ls -lAF --color" # Full, colorized listing
alias ls="command ls --color"
alias lsd="ls -lF --color | grep --color=never '^d'" # List directories only
alias p="cd ~/projects"
alias r="ranger"
alias sv="sudo vim"
alias sr="sudo ranger"
alias t="tmux a || tmux" # Open tmux, or attach to disconnected sess
alias upg="sudo dnf upgrade -y" # upgrade system
alias v="vim"
alias week="date +%V" # get weeknumber
alias yt="youtube-dl --add-metadata -ic" # Download video link
alias yta="yt -x -f bestaudio/best" # Download only audio


