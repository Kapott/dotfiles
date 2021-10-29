# Dotfiles, by kapott

I've gone over a lot of iterations with regard to storing dotfiles. At one time I even wanted
to use ansible! Yeah, rabbit holes - I have this intellectual grativation towards them.

Anyway! Let's be pragmatic about this. I just want settings, but I work on multiple types
of systems. Macos, *buntu, alpine, centos, *BSD, WSL2 etc.

So, as you might imagine, maintaining my settings is a bit of a nightmare. I almost used ansible
with some fancy "when" syntax to do everything for me. Until I cloned the repository.

And it's name juxtaposed my intended actions so very heavily.

`dotfiles`

Configuration files. Not "platform independent application installation and customization files".
So I sobered up and though "Let's do this the sane person style".

And so I ended up back with GNU Stow. With a little, pragmatic, twist.

`stow -d {platform_directory} -t $HOME`

