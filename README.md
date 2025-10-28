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

_These dotfiles contain configurations for other programs that should be installed manually._

## TODO

- [x] Install Zsh (I prefer it; I like the configurability of Zsh)
- [x] Install Vim (this file was edited in Vi - similar, but different enough to be confusing)
- [ ] Install Neovim (why Vi, Vim and Neovim? Vi because it was the default for visudo [note: I also had to install sudo], Vim because it's better than Vi and a solid fallback that exists in most distros, Neovim because it kicks ass!)

_I've also already installed git, but this is not yet connected to my GitHub profile or any remote repositories._

## Notes

Ooh! Vim has syntax highlighting for Markdown by default? I never knew! It's also immediately just infinitely nicer working in Vim than in Vi.

_Huh, syntax highlighting is disabled when I create an empty .vimrc for future configuration. I've had to re-enable it with `syntax on`. I do wonder what other defaults are changed when an empty .vimrc exists?_
_Mildly confused here. I know `/etc/vimrc` ought to be sourced as well. Surely it still is? It wasn't responsible for the defaults, was it? Something to perhaps investigate another time._
_My best theory right now is that the commented `.._skip_defaults` line in `/etc/vimrc` **WOULD** skip Vim's defaults **IF** `~/.vimrc` were not present. However, since this is commented out, the defaults **DO** get loaded but... **ONLY IF** a `~/.vimrc` file is not otherwise present. Makes sense!_

---

_I've just installed Zsh, Oh My Zsh and the Powerlevel10k theme._
_This comes with a lot of baggage! Not very minimalist, not very KISS of me._
_It's all very pretty though!_

Long story short, I've lost track (_a little_) of what's going on in
my `.zshrc` file.
I know it loads a separate `.p10k.zsh` file with additional setup.
And at some point, we've wound up with the ohmyzsh/ohmyzsh repo cloned
locally at `~/.oh-my-zsh`. I figure let's add that as a submodule.
(I'd add a shrug emoji right here if I had an emoji keyboard configured right now, but I don't.)

### On configuring caps lock to function as Esc or Ctrl...

This resulted in no commits from my `$HOME` dotfiles directory, so let
me just drop this here. This document is **GOSPEL**:

- https://ejmastnak.com/tutorials/arch/caps2esc/

_For some reason, this was a lot trickier to setup in Linux than it was_
_in Windows. But follow that blogpost to the letter, and you achieve_
_what is clearly a somewhat hacky solution._
