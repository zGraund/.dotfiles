if [[ -x /usr/lib/command-not-found || -x /usr/share/command-not-found/command-not-found ]]; then
  command_not_found_handler() {
    if [[ -x /usr/lib/command-not-found ]]; then
      /usr/lib/command-not-found -- "$1"
      return $?
    elif [[ -x /usr/share/command-not-found/command-not-found ]]; then
      /usr/share/command-not-found/command-not-found -- "$1"
      return $?
    else
      printf "zsh: command not found: %s\n" "$1" >&2
      return 127
    fi
  }
fi
