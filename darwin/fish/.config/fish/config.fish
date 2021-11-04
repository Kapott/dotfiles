test -d ~/bin; and fish_add_path ~/bin
test -d /usr/local/bin; and fish_add_path /usr/local/bin
test -d /usr/local/sbin; and fish_add_path /usr/local/sbin

for file in aliases
	test -f ~/.config/fish/$file.fish && source ~/.config/fish/$file.fish
end

# Set vim to be the default system editor.
set --export --universal EDITOR "vim"

# We use ripgrep by default, and want to show hidden files by default.
set --export --universal FZF_DEFAULT_COMMAND "rg --hidden --files -g '!.git/'"

fish_ssh_agent
if status is-interactive
	# Commands to run in interactive session can go here
end
