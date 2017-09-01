#!/bin/bash

export DOTFILES=$HOME/dotfiles

# Install Tmux Plugin Manager
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

# Setup symlink to ~/.tmux.conf
if [ -f ~/.tmux.conf ] || [ -h ~/.tmux.conf ]; then
  mv ~/.tmux.conf ~/.tmux.conf.backup
fi

$echo "Creating symlink to ~/.tmux.conf"
ln -s $DOTFILES/tmux.conf $HOME/.tmux.conf

