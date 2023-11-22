#!/bin/sh
# This script creates symlinks for my dotfiles
mkdir -p ~/.config

ln -s ~/.dotfiles/tmux ~/.config/tmux
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

ln -s ~/.dotfiles/helix ~/.config/helix

