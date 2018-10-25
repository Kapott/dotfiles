# dotfiles

The dotfiles I use on my day-to-day development machines and VM's.

Just clone it anywhere (I use ~/.dotfiles), `cd` into the directory and run `install.sh`.

The installation will use the GNU `stow` command to create symlinks from the git repo to the
home directory, on provided locations, download the `hack` truetype font from github, and refresh the font cache.

Note that some dotfiles/scripts have certain dependencies which I have yet to flesh out; e.g. The `i3` window manager, requires `i3lock` to be available as well.
