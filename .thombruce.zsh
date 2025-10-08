# Custom Config for Zsh

alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

alias ls='eza --icons=auto --level=2'

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# Explicitly should come near END of file (after compinit)
eval "$(zoxide init zsh)"
alias cd='z'
