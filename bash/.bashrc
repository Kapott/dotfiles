# .bashrc : for all interactive shells

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

stty -ixon # disable ctrl-s and ctrl-q
shopt -s autocd # cd into a directory by typing it's name
HISTSIZE= HISTFILESIZE= # infinite history size

# capitalize username and host if we're on the root user
if [ "$EUID" -ne 0 ]
	then export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
	else export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]ROOT\[$(tput setaf 2)\]@\[$(tput setaf 4)\]$(hostname | awk '{print toupper($0)}') \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
fi

# Load all of our bash glory!
for file in $HOME/{.bash_aliases,.bash_functions,.bash_extra}
do
	[ -r "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing
shopt -s nocaseglob;
shopt -s histappend;
shopt -s cdspell;

# Enable some bash 4 features
for options in audocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;


