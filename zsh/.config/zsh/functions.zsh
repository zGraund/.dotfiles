# General functions for zsh

# PATH helper
function prepend_to_path() {
	path=("@1" $path)
}

# Plugin manager
function source_if_exist() {
	# Try to source first from zdotdir and then using the
	# path provided
	[ -f "$ZDOTDIR/$1" ] && source "$ZDOTDIR/$1"
	[ -f "$1" ] && source "$1"
}

function zsh_add_plugin() {
	local plugin_name="$(echo "$1" | cut -d "/" -f 2)"
	local plugin_dir="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/plugins"
	if [ ! -d "$plugin_dir/$plugin_name" ]; then
		print "\nInstalling plugin $1 in $plugin_dir/$plugin_name...\n"
		git clone --depth=1 "https://github.com/$1.git" "$plugin_dir/$plugin_name"
	fi
	source_if_exist "$plugin_dir/$plugin_name/$plugin_name.zsh"
	source_if_exist "$plugin_dir/$plugin_name/$plugin_name.plugin.zsh"
	source_if_exist "$plugin_dir/$plugin_name/$plugin_name.zsh-theme"
}
