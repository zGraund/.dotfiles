# TokyoNight colors for Tmux
set -g @theme_blue "#7aa2f7"
set -g @theme_gray "#3b4261"
set -g @theme_light_gray "#a9b1d6"
set -g @theme_black "#16161e"
set -g @theme_red "#c53b53"

set -g mode-style "fg=#{@theme_blue},bg=#{@theme_gray}"

set -g message-style "fg=#{@theme_blue},bg=#{@theme_gray}"
set -g message-command-style "fg=#{@theme_blue},bg=#{@theme_gray}"

set -g pane-border-style "fg=#{@theme_gray}"
set -g pane-active-border-style "fg=#{@theme_blue}"

set -g status "on"
set -g status-justify "left"

set -g status-style "fg=#{@theme_blue},bg=#{@theme_black}"

set -g status-left-length "100"
set -g status-right-length "100"

set -g status-left-style NONE
set -g status-right-style NONE

set -g status-left \
	"#{?client_prefix,#[fg=#{@theme_black}#,bg=#{@theme_red}],#[fg=#{@theme_black}#,bg=#{@theme_blue}]} #S #{?client_prefix,#[fg=#{@theme_red}#,bg=#{@theme_black}],#[fg=#{@theme_blue}#,bg=#{@theme_black}]}"

# 12h
# set -g status-right "#[fg=#{@theme_black},bg=#{@theme_black},nobold,nounderscore,noitalics]#[fg=#{@theme_blue},bg=#{@theme_black}] #{prefix_highlight} #[fg=#{@theme_gray},bg=#{@theme_black},nobold,nounderscore,noitalics]#[fg=#{@theme_blue},bg=#{@theme_gray}] %Y-%m-%d  %I:%M %p #[fg=#{@theme_blue},bg=#{@theme_gray},nobold,nounderscore,noitalics]#[fg=#{@theme_black},bg=#{@theme_blue},bold] #h "

# 24h
set -g status-right \
	"#[fg=#{@theme_gray},bg=#{@theme_black}]#[fg=#{@theme_blue},bg=#{@theme_gray}] %d-%m-%Y  %H:%M #[fg=#{@theme_blue},bg=#{@theme_gray}]#[fg=#{@theme_black},bg=#{@theme_blue},bold] #h "

setw -g window-status-activity-style "underscore,fg=#{@theme_light_gray},bg=#{@theme_black}"
setw -g window-status-separator ""
setw -g window-status-style "NONE,fg=#{@theme_light_gray},bg=#{@theme_black}"
setw -g window-status-format "#[fg=#{@theme_black},bg=#{@theme_black}]#[default] #I  #W #F #[fg=#{@theme_black},bg=#{@theme_black}]"
setw -g window-status-current-format "#[fg=#{@theme_black},bg=#{@theme_gray}]#[fg=#{@theme_blue},bg=#{@theme_gray},bold] #I  #W #F #[fg=#{@theme_gray},bg=#{@theme_black}]"
