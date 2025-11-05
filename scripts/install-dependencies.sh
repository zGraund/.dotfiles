#!/bin/bash
# This script is specific for ubuntu
set -e

echo "Upgrading packages and installing dependencies!"
echo ""

# Upgrade all packages
sudo apt update
sudo apt upgrade -y

# Install zsh and required packages
sudo apt install zsh git curl

# install oh-my-zsh
echo -e "Installing oh-my-zsh...\n"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

ZSH_DIR=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}
# install powerlevel10k
dir=$ZSH_DIR/themes/powerlevel10k
if [ -d "$dir" ]; then
    echo -e "Directory '$dir' already exists. Skipping install of powerlevel10k...\n"
else
    echo -e "Installing powerlevel10k...\n"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$dir"
fi

# install zsh-syntax-highlighting
dir=$ZSH_DIR/plugins/zsh-syntax-highlighting
if [ -d "$dir" ]; then
    echo -e "Directory '$dir' already exists. Skipping install of zsh-syntax-highlighting...\n"
else
    echo -e "Installing zsh-syntax-highlighting...\n"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$dir"
fi

# install zsh-autosuggestions
dir=$ZSH_DIR/plugins/zsh-autosuggestions
if [ -d "$dir" ]; then
    echo -e "Directory '$dir' already exists. Skipping install of zsh-autosuggestions...\n"
else
    echo -e "Installing zsh-autosuggestions...\n"
    git clone https://github.com/zsh-users/zsh-autosuggestions "$dir"
fi

echo -e "Done! \nYou can now run the symlink install script"
echo -e "You can change the default shell with:\nchsh -s $(which zsh)"
