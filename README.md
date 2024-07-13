# My personal dotfiles

Still work in progress

## Install

1. Clone the repository `git clone https://github.com/zGraund/.dotfiles.git $HOME`
2. Install dependencies (replace apt with your package manager)
    1. `sudo apt update && sudo apt upgrade -y`
    2. `xargs -a dependencies.txt sudo apt install` [^1]
    3. install a [nerd font](https://www.nerdfonts.com/font-downloads) (optional but highly recommended)
3. Create symlinks with stow `stow <dir1> <dir2>`

[^1]: Depending on the package manager some binaries might need to be installed or configured manually, make sure that:
    1. Neovim version is at least v0.10.x
    2. The path for fzf in `zsh/fzf.zsh` is correct
    3. On Ubuntu/Debian batcat is symlinked to bat `ln -s $(which batcat) ~/.local/bin/bat`
    4. On Ubuntu/Debian fd-find is symlinked to fd `ln -s $(which fdfind) ~/.local/bin/fd`
