# Just a quick reminder;
# source order (officially)
#
# /etc/profile
# /etc/bash_profile
# $HOME/.profile
# $HOME/.bash_profile
#
# and then, on every terminal you open
#
# $HOME/.bashrc

#!/bin/sh

# $HOME/bin contains symlinks to $HOME/scripts
export PATH="$PATH:$HOME/bin:$HOME/.scripts"

export EDITOR="vim"
export TERMINAL="st"
export BROWSER="firefox"
export READER="zathura"

# set XON/XOFF, so we can use Ctrl-s as the reverse of Ctrl-r in bash
[[ $- == *i* ]] && stty -ixon

[ -f ~/.bashrc ] && source ~/.bashrc

# Switch escape and caps and use wal colors if tty:
# sudo -n loadkeys ~/.scripts/ttymaps.kmap 2>/dev/null

# pywal color scheme
#wal -Rn
