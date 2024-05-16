# My personal dotfiles

Still work in progress

## Install

1. Clone the repository `git clone https://github.com/zGraund/.dotfiles.git $HOME`
2. Install dependencies (replace apt with your package manager)
    1. `sudo apt update && sudo apt upgrade -y`
    2. `xargs -a dependencies.txt sudo apt install` [^1]
    3. install a [nerd font](https://www.nerdfonts.com/font-downloads) (not required but highly recommended)
3. Create symlinks with stow

[^1]: Install neovim from source if the package version is < v0.9.x
