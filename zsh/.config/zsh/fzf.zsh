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
# export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
# --color=fg:#c0caf5,bg:-1,hl:#ff9e64 \
# --color=fg+:#c0caf5,bg+:#292e42,hl+:#ff9e64 \
# --color=info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff \
# --color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a"

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --color=fg:#d0d0d0,fg+:#d0d0d0,bg:#121212,bg+:#262626 \
  --color=hl:#5f87af,hl+:#5fd7ff,info:#afaf87,marker:#87ff00 \
  --color=prompt:#d7005f,spinner:#af5fff,pointer:#af5fff,header:#87afaf \
  --color=border:#000000,label:#aeaeae,query:#d9d9d9 \
  --border='rounded' --border-label='' --preview-window='border-rounded' --prompt='> ' \
  --marker='>' --pointer='◆' --separator='─' --scrollbar='│' \
  "

# need new version of fzf
# export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
# 	--highlight-line \
# 	--info=inline-right \
# 	--ansi \
# 	--layout=reverse \
# 	--border=none \
# 	--color=bg+:#283457 \
# 	--color=bg:#16161e \
# 	--color=border:#27a1b9 \
# 	--color=fg:#c0caf5 \
# 	--color=gutter:#16161e \
# 	--color=header:#ff9e64 \
# 	--color=hl+:#2ac3de \
# 	--color=hl:#2ac3de \
# 	--color=info:#545c7e \
# 	--color=marker:#ff007c \
# 	--color=pointer:#ff007c \
# 	--color=prompt:#2ac3de \
# 	--color=query:#c0caf5:regular \
# 	--color=scrollbar:#27a1b9 \
# 	--color=separator:#ff9e64 \
# 	--color=spinner:#ff007c \
# "
