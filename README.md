# .dotfiles

These are my .dotfiles (configuration files from the home directory in my new Arch Linux environment).

Ah, that's right! I've just installed Arch Linux! What a rush!!

My aim is to gradually enhance this environment, sharing my non-private configuration here as I add to it.

## Useful Commands

```sh
# Yazi file explorer
y

# Television fuzzy-finder
tv

# eza file list
ls # list files with icons
ls -T # list as a tree with depth 2
```

## Default Tools Replaced

1. ls with eza (and y [yazi] as a file manager)
2. cat with bat
3. cd with z (zoxide)

## Setup

> _**Important!** These steps are not guaranteed to work._
> _They were written sometime after/during complex setup._
> _They will be amended as issues are discovered._

First, I recommend installing [yadm](https://yadm.io/).

Then, from your `$HOME` directory we should be able to run:

```sh
yadm clone https://github.com/thombruce/.dotfiles
yadm submodule update --init --recursive # Is this correct? Will it obtain correct branches/commits?
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
```

Alternatively, yadm should prompt you to run the `bootstrap` script upon cloning.
This can also be run manually with the command `yadm bootstrap`.

_These dotfiles contain configurations for other programs that should be installed manually._
_Perhaps I can also automate this using `yadm bootstrap` (note that the script should remain idempotent,
meaning any such automation should **either** install or update [or do nothing]--it should be runnable
on existing setups)._

## Notes

### On configuring caps lock to function as Esc or Ctrl...

This resulted in no commits from my `$HOME` dotfiles directory, so let
me just drop this here. This document is **GOSPEL**:

- https://ejmastnak.com/tutorials/arch/caps2esc/

_For some reason, this was a lot trickier to setup in Linux than it was_
_in Windows. But follow that blogpost to the letter, and you achieve_
_what is clearly a somewhat hacky solution._
