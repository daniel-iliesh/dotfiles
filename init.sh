#!/bin/bash

ln -sfn ~/.dotfiles/nvim ~/.config/nvim
ln -sfn ~/.dotfiles/.zshrc ~/.zshrc
ln -sfn ~/.dotfiles/.gitconfig ~/.gitconfig
ln -sfn ~/.dotfiles/.tmux.conf ~/.tmux.conf 
ln -sfn ~/.dotfiles/.oh-my-zsh ~/.oh-my-zsh 

echo "Dotfiles linked successfully!"
