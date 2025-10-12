# Custom Config for Zsh

export EDITOR='/usr/bin/nvim'

# alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias dotfiles='yadm'

alias vi='vim'
alias vim='nvim'
alias code='nvim'

# Use `icat [image path]` to open an image in Kitty terminal
alias icat='kitten icat'

alias trash='gio trash'
# Dependencies: glib2, gvfs
# Useful commands:
# trash [file]
# trash --list
# trash --empty

alias top='btop'

alias ls='eza --icons=auto --level=2'

alias cat='bat' # Paginates using less pkg. Use 'bat --paging=never' instead for a more cat-like default.

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# mise activate provides some additional mise functionality
# and allows us to use installed versions of languages directly
eval "$(/usr/bin/mise activate zsh)"

# Explicitly should come near END of file (after compinit)
eval "$(zoxide init zsh)"
alias cd='z'
