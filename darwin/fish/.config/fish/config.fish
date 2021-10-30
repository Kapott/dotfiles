for file in aliases
	test -f ~/.config/fish/$file.fish && source ~/.config/fish/$file.fish
end


fish_ssh_agent
if status is-interactive
	# Commands to run in interactive session can go here
end
