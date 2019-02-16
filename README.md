# dotfiles

The dotfiles I use on my day-to-day development machines and VM's.

Just clone it anywhere (I use ~/.dotfiles), `cd` into the directory and run any of the `make`
commands listed below. (I used to use GNU Stow to manage my dotfiles, but have since switched to
abusing `make`, since I want to be even lazier when setting up my machines and `make` allows me to
do just that.

## dotfiles

`make dotfiles`
This will symlink (and backup existing, if deemed necessary) dotfiles. Note that this is also the
one which switches capslock and escape, because I'm all about the vim baby.

`make i3`
This will symlink the i3 config file and i3status config files.

`make ubuntu`, `make arch`, `make debian`, `make fedora` etc. You get the idea.
These will install the packages I want to have on any given dist I use. Since I
have different dists on different machines, I really don't want to think about the base packages for
any of these.

## disclaimer

Using a `Makefile` for managing dotfiles and dependencies is lunacy, and not what the make was
intended for. By using these files you are admitting that you are willingly abusing your `make`
command, and forcing it into submission.

I quote:

>> The purpose of the make utility is to determine automatically which pieces of a large program need to be recompiled, and issue the commands to recompile them.


Use at your own peril, stranger. There be dragons here ;)
