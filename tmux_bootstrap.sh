#!/bin/bash

export DOTFILES=$HOME/dotfiles

# Setup symlink to ~/.tmux.conf
if [ -f $HOME/.tmux.conf ] || [ -h $HOME/.tmux.conf ]; then
  mv $HOME/.tmux.conf $HOME/.tmux.conf.backup
fi

echo "[Status][tmux] | Creating symlink to $HOME/.tmux.conf"
ln -s $DOTFILES/tmux.conf $HOME/.tmux.conf
