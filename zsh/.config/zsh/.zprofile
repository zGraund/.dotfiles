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
# go
export GOPATH="$XDG_DATA_HOME/go"

# rustup and cargo
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"

# elixir
export PATH=$HOME/.elixir-install/installs/elixir/1.19.4-otp-28/bin:$PATH
export PATH=$HOME/.elixir-install/installs/otp/28.1/bin:$PATH

export path=(
	"$BIN_HOME" # user bin
	"$GOPATH/bin"
	"$CARGO_HOME/bin"
	"/usr/local/go/bin"

	# WARN: DON'T quote the following path variable
	$path
)

export NVM_DIR="$XDG_DATA_HOME/nvm"
if [[ -z $NVM_BIN && -z $NVM_INC ]]; then
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
fi
