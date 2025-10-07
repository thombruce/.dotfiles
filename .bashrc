# TODO: .bashrc and associated bash files are now redundant
#       Consider removing them from .dotfiles repo

#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$'
