# Set up fzf key bindings and fuzzy completion
# Use this if fzf is 0.48.0 or later
# source <(fzf --zsh)
# else we need to source the files manually
source_if_exist "/usr/share/doc/fzf/examples/completion.zsh"
source_if_exist "/usr/share/doc/fzf/examples/key-bindings.zsh"

# Use the CLI ripgrep to respect ignore files (like '.gitignore'),
# display hidden files, and exclude the '.git' directory.
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'

export FZF_COMPLETION_TRIGGER=''
bindkey '^F' fzf-completion
bindkey '^I' $fzf_default_completion

# Colorscheme
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
--color=fg:#c0caf5,bg:-1,hl:#ff9e64 \
--color=fg+:#c0caf5,bg+:#292e42,hl+:#ff9e64 \
--color=info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff \
--color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a"
