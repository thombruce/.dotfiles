# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/thombruce/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Custom config
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
# End of custom config
