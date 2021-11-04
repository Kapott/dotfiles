test -d ~/bin; and fish_add_path ~/bin
test -d /usr/local/bin; and fish_add_path /usr/local/bin
test -d /usr/local/sbin; and fish_add_path /usr/local/sbin

for file in aliases
	test -f ~/.config/fish/$file.fish && source ~/.config/fish/$file.fish
end


fish_ssh_agent
if status is-interactive
	# Commands to run in interactive session can go here
end
