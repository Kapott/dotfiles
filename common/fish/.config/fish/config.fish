# This in our $HOME that we want in the path
test -d $HOME/bin; and fish_add_path $HOME/bin
test -d $HOME/.local/bin; and fish_add_path $HOME/.local/bin
test -d $HOME/go; and fish_add_path $HOME/go
test -d $HOME/go/bin; and fish_add_path $HOME/go/bin

# Things outside of our $HOME we might want in the path
test -d /usr/local/bin; and fish_add_path /usr/local/bin
test -d /usr/local/sbin; and fish_add_path /usr/local/sbin
test -d /usr/games; and fish_add_path /usr/games
test -d /usr/local/games; and fish_add_path /usr/local/games
test -d /snap; and fish_add_path /snap/bin
command --query flatpak; and test -d /var/lib/flatpak/exports/bin; and fish_add_path /var/lib/flatpak/exports/bin

for file in aliases
	test -f ~/.config/fish/$file.fish && source ~/.config/fish/$file.fish
end

# Add brew path
if command --query brew
	fish_add_path /opt/homebrew/sbin
	fish_add_path /opt/homebrew/bin
    brew --prefix coreutils >/dev/null; and fish_add_path (brew --prefix coreutils)/libexec/gnubin
end

# Set vim to be the default system editor.
set --export --universal EDITOR "vim"

# We use ripgrep by default, and want to show hidden files by default.
set --export --universal FZF_DEFAULT_COMMAND "rg --hidden --files -g '!.git/'"

# No greeting please.
set -gx fish_greeting ""

fish_ssh_agent
fish_vi_key_bindings

if status is-interactive
	# Commands to run in interactive session can go here
end
