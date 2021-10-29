# dotfiles

I've gone over a lot of iterations with regard to storing dotfiles. At one time I even wanted
to use ansible! Yeah, rabbit holes - I have this strange grativation towards them.

Anyway! Let's be pragmatic about this. I just want settings, but I work on multiple types
of systems. Macos, *buntu, alpine, centos, *BSD, WSL2 etc.

So, as you might imagine, maintaining my settings is a bit of a nightmare. I almost used ansible
with some fancy "when" syntax to do everything for me. Until I cloned the repository.

And it's name juxtaposed to my intended actions made my think-organ itch.

`dotfiles`

Configuration files. Not "platform independent application installation and customization files".
So I sobered up and though "Let's do this the sane person style".

And so I ended up back with GNU Stow. With a little, pragmatic, twist.

And another one.

And another one.

Oh, I bet you know where this is going..

> "Would you tell me, please, which way I ought to go from here?"
> "That depends a good deal on where you want to get to," said the Cat.
> "I don't much care where--" said Alice.
> "Then it doesn't matter which way you go," said the Cat.
> "-so long as I get SOMEWHERE," Alice added as an explanation.
> "Oh, you're sure to do that," said the Cat, "if you only walk long enough."
