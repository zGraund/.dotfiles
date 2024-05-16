# Make path have only unique entries
typeset -U path PATH

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export BIN_HOME="$HOME/.local/bin"

# skip the global call of compinit that are present in some distros
skip_global_compinit=1

ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
