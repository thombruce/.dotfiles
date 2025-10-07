# .dotfiles

These are my .dotfiles (configuration files from the home directory in my new Arch Linux environment).

Ah, that's right! I've just installed Arch Linux! What a rush!!

My aim is to gradually enhance this environment, sharing my non-private configuration here as I add to it.

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
