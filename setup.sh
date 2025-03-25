#!/bin/bash

# Determine here if macos or linux in a variable

#!/bin/bash

OS=$(uname)

if [[ "$OS" == "Darwin" ]]; then
    echo "Running on macOS"
    brew install fzf
    brew install fd
    brew install ripgrep

elif [[ "$OS" == "Linux" ]]; then
    echo "Running on Linux"
    sudo apt install fzf
    sudo apt install fd-find
    sudo apt install ripgrep
else
    echo "Unknown OS: $OS"
fi

zpm install jeffreytse/zsh-vi-mode
zpm install zsh-users/zsh-syntax-highlighting
zpm install zsh-users/zsh-autosuggestions

zpm install romkatv/powerlevel10k --no-enable 
