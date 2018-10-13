# Add our own bin dir to the path
export PATH=$PATH:$HOME/bin

# Load all of our bash glory!
for file in ~./{bash_path,bash_aliases,bash_functions,bash_extra}
do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
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


