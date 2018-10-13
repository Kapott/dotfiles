#!/bin/bash

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ~="cd ~"
alias -- -="cd -"

alias d="cd ~/Documents"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias p="cd ~/projects"
alias g="git"

# List all files, colorized, long format, no . or ..
alias l="ls -lAF --color"

# List all directories
alias lsd="ls -lF --color | grep --color=never '^d'"

# Always color my ls
alias ls="command ls --color"

# Get week number
alias week="date +%V"
