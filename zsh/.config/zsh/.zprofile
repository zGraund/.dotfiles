# Editor
export EDITOR="nvim"
export VISUAL="nvim"

# WSL host browser path
export BROWSER="/mnt/c/Program Files/Google/Chrome/Application/chrome.exe"

# NPM config
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"

# dotnet
export DOTNET_CLI_HOME="$XDG_DATA_HOME/dotnet"

# PATH
export GOPATH="$XDG_DATA_HOME/go"
export path=(
	"$BIN_HOME" # user bin
	"$GOPATH/bin"
	"/usr/local/go/bin"

	# WARN: DON'T quote the following path variable
	$path
)

export NVM_DIR="$XDG_DATA_HOME/nvm"
if [[ -z $NVM_BIN && -z $NVM_INC ]]; then
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
fi
