# Custom Config for Zsh

if [[ -r "$HOME/.private.zsh" ]]; then
  source "$HOME/.private.zsh"
fi

# Results in a more expected sort order for non-alphanumeric
# characters when using sort
export LC_ALL=C

# Allow user-wide installation of NPM packages
PATH="$HOME/.local/bin:$PATH"
export npm_config_prefix="$HOME/.local"

export EDITOR='/usr/bin/nvim'

export DOOMWADDIR="${HOME}/Games/DOOM/WADs"

# alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias dotfiles='yadm'

alias vi='vim'
alias vim='nvim'
alias code='nvim'

# Assessing helix as a Neovim alternative - not sure I love it...
# Might have the same issue as LazyVim, LunarVim and the like;
# it's just preconfigured in a certain way and we prefer configuring
# Neovim from scratch to our own liking
alias hx='helix'

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
eval "$(/home/thombruce/.local/bin/mise activate zsh)"

export MISE_DISABLE_TOOLS=["rust"]

# Explicitly should come near END of file (after compinit)
eval "$(zoxide init zsh)"
alias cd='z'
