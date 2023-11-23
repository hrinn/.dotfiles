#!/bin/sh
# This script creates symlinks for my dotfiles
mkdir -p ~/.config

# tmux setup
ln -s ~/.dotfiles/tmux ~/.config/tmux
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

# helix setup
ln -s ~/.dotfiles/helix ~/.config/helix

# zsh setup
ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/.dotfiles/zsh/.p10k.zsh ~/.p10k.zsh

# neofetch setup
ln -s ~/.dotfiles/neofetch ~/.config/neofetch
