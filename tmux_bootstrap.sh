#!/bin/bash

export DOTFILES=$HOME/dotfiles

# Install Tmux Plugin Manager
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

# Setup symlink to ~/.tmux.conf
if [ -f $HOME/.tmux.conf ] || [ -h $HOME/.tmux.conf ]; then
  mv $HOME/.tmux.conf $HOME/.tmux.conf.backup
fi

$echo "Creating symlink to $HOME/.tmux.conf"
ln -s $DOTFILES/tmux.conf $HOME/.tmux.conf
