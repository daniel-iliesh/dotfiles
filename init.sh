#!/bin/bash

# Dotfiles
ln -sfn ~/.dotfiles/nvim ~/.config/nvim
ln -sfn ~/.dotfiles/.zshrc ~/.zshrc
ln -sfn ~/.dotfiles/.gitconfig ~/.gitconfig
ln -sfn ~/.dotfiles/.tmux.conf ~/.tmux.conf 
ln -sfn ~/.dotfiles/.oh-my-zsh ~/.oh-my-zsh 
ln -sfn ~/.dotfiles/.p10k.zsh ~/.p10k.zsh
ln -sfn ~/.dotfiles/i3/config ~/.config/i3/config

# Scripts
ln -sfn ~/.dotfiles/scripts/zpm ~/.local/bin/zpm
ln -sfn ~/.dotfiles/scripts/tmux-sessionizer ~/.local/bin/tmux-sessionizer

# Fonts
ln -sfn ~/.dotfiles/fonts/FiraCodeNerdFont ~/.fonts/FiraCodeNerdFont
fc-cache -fv

echo "Dotfiles linked successfully!"
