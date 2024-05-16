# set tabs length
tabs 4

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# load LS_COLORS, specify a path after -b to change colors
eval "$(dircolors -b)"

# Load functions
source "$ZDOTDIR/functions.zsh" # This file must be present

# Create directories nedeed if they don't exist
ZSH_STATE="${XDG_STATE_HOME:-$HOME/.local/state}/zsh"
ZSH_CACHE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"

mkdir -p $ZSH_STATE
mkdir -p $ZSH_CACHE

# Path to p10k.zsh
POWERLEVEL9K_CONFIG_FILE="$ZDOTDIR/p10k.zsh"
ZLE_RPROMPT_INDENT=0

# History file
export HISTFILE="$ZSH_STATE/zsh_history"
export HISTSIZE=50000
export SAVEHIST=10000

# Options
setopt autocd
setopt autopushd
setopt pushdignoredups
setopt pushdminus

setopt histexpiredupsfirst
setopt histignoredups
setopt histignorespace
setopt histverify
setopt sharehistory
setopt extendedhistory

setopt alwaystoend
setopt completeinword

setopt noflowcontrol
setopt interactivecomments
setopt longlistjobs
setopt promptsubst

zle_highlight+=(paste:none) # Disable paste highlight

# vi mode
bindkey -v
export KEYTIMEOUT=10

# Completion setup
zmodload zsh/complist # Should be called before compinit

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

#bindkey -M menuselect '^xh' accept-and-hold                # Hold
bindkey -M menuselect '^o' accept-and-infer-next-history  # Next
bindkey -M menuselect '^u' undo

# Suggestion bindings
bindkey '^n' autosuggest-accept
bindkey '^o' autosuggest-execute
bindkey '^k' up-line-or-search
bindkey '^j' down-line-or-search

# Load completion before compinit
zsh_add_plugin "zsh-users/zsh-completions"

autoload -U compinit;
compinit -i -d "$ZSH_CACHE/zcompcache"
_comp_options+=(globdots)

zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path "$ZSH_CACHE"

zstyle ':completion:*' menu select

# Autocomplete options for cd instead of directory stack
zstyle ':completion:*' complete-options true

#zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}-- %D %d --%f'
zstyle ':completion:*:*:*:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:*:*:*:warnings' format ' %F{red}-- no matches found --%f'

# Required for completion to be in good groups (named after the tags)
zstyle ':completion:*' group-name ''
zstyle ':completion:*:*:-command-:*:*' group-order aliases builtins functions commands

# Pretty messages during pagination
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'

# Show message while waiting for completion
#zstyle ':completion:*' show-completer true

# Colors for completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Case insensitive and
# Smart matching of dashed values, e.g. f-b matching foo-bar
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' ignored-patterns '*.dll' '*.DLL' # ignore dlls on wsl

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd '^e' edit-command-line

# Add plugins here
source_if_exist "$XDG_CONFIG_HOME/aliases"
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "romkatv/powerlevel10k"
zsh_add_plugin "zdharma-continuum/fast-syntax-highlighting"

cursor_mode() {
    # 0  ⇒  blinking block.
    # 1  ⇒  blinking block (default).
    # 2  ⇒  steady block.
    # 3  ⇒  blinking underline.
    # 4  ⇒  steady underline.
    # 5  ⇒  blinking bar, xterm.
    # 6  ⇒  steady bar, xterm.

    cursor_block='\e[2 q'
    cursor_beam='\e[6 q'

    function zle-keymap-select {
        if [[ ${KEYMAP} == vicmd ]] ||
            [[ $1 = 'block' ]]; then
            echo -ne $cursor_block
        elif [[ ${KEYMAP} == main ]] ||
            [[ ${KEYMAP} == viins ]] ||
            [[ ${KEYMAP} = '' ]] ||
            [[ $1 = 'beam' ]]; then
            echo -ne $cursor_beam
        fi
    }

    zle-line-init() {
        echo -ne $cursor_beam
    }

    zle -N zle-keymap-select
    zle -N zle-line-init
}

cursor_mode

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/p10k.zsh.
[[ ! -f ~/.config/zsh/p10k.zsh ]] || source ~/.config/zsh/p10k.zsh
