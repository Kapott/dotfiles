test -d ~/bin; and fish_add_path ~/bin
test -d /usr/local/bin; and fish_add_path /usr/local/bin
test -d /usr/local/sbin; and fish_add_path /usr/local/sbin

for file in aliases
	test -f ~/.config/fish/$file.fish && source ~/.config/fish/$file.fish
end

# Add brew path
if command --query brew
	fish_add_path /opt/homebrew/sbin
	fish_add_path /opt/homebrew/bin
    brew --prefix coreutils >/dev/null; and fish_add_path (brew --prefix coreutils)/libexec/gnubin
end

# Base Golang install stuff
if test -d "/usr/local/go"
	set -gx __default_go_path "$HOME/Work/go"
	set -gx GOPATH "$__default_go_path"

	mkdir -p "$__default_go_path"

	fish_add_path /usr/local/go/bin
	fish_add_path "$GOPATH/bin"
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
