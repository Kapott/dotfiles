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
	then export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 7)\]\u\[$(tput setaf 1)\]@\[$(tput setaf 7)\]\h \[$(tput dim)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
	else export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 7)\]ROOT\[$(tput setaf
    1)\]@\[$(tput setaf 7)\]$(hostname | awk '{print toupper($0)}') \[$(tput dim)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
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

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'

    # Show the currently running command in the terminal title:
    # http://www.davidpashley.com/articles/xterm-titles-with-bash.html
    show_command_in_title_bar()
    {
        case "$BASH_COMMAND" in
            *\033]0*)
                # The command is trying to set the title bar as well;
                # this is most likely the execution of $PROMPT_COMMAND.
                # In any case nested escapes confuse the terminal, so don't
                # output them.
                ;;
            *)
                echo -ne "\033]0;${USER}@${HOSTNAME}: ${BASH_COMMAND}\007"
                ;;
        esac
    }
    trap show_command_in_title_bar DEBUG
    ;;
*)
    ;;
esac

