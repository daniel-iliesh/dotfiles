#!/bin/bash

OS=$(uname)
UPDATE=$1

if [[ "$OS" == "Darwin" ]]; then
    echo "Running on macOS"
    brew install neovim
    brew install fzf
    brew install fd
    brew install ripgrep

elif [[ "$OS" == "Linux" ]]; then
    echo "Running on Linux"
    echo "Installing Neovim"
    if [[ -d /opt/nvim ]]; then
        echo "Already installed at /opt/nvim"
        if [[ $UPDATE == "--update" ]]; then
            echo "Updating..."
            echo "Downloading latest Neovim version"
            curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
            echo "Removing old nvim location"
            sudo rm -rf /opt/nvim
            echo "Unpacking new version"
            sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
            echo "Cleaning up..."
            rm -f nvim-linux-x86_64.tar.gz
        fi
    else
        echo "Downloading latest Neovim version"
        curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
        echo "Unpacking Neovim"
        sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
        echo "Cleaning up..."
        rm -f nvim-linux-x86_64.tar.gz
        echo "PATH='$PATH:/opt/nvim-linux-x86_64/bin'" >> ~/.zshrc
    fi

    sudo apt install fzf
    sudo apt install fd-find
    sudo apt install ripgrep
else
    echo "Unknown OS: $OS"
fi

./init.sh

if [[ -f $HOME/.local/bin/zpm ]]; then
  zpm install jeffreytse/zsh-vi-mode
  zpm install zsh-users/zsh-syntax-highlighting
  zpm install zsh-users/zsh-autosuggestions
  
  zpm install romkatv/powerlevel10k --no-enable 
else
  echo -e "Z Package Manager is not installed.\n Make sure you added ~/.local/bin to the PATH variable"
fi
