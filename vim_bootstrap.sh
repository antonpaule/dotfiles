#!/bin/bash

export DOTFILES=$HOME/dotfiles

# Install NeoBundle
sh -c "$(curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh)"

# Install YCM
git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
python3 install.py --clangd-completer
cd

# Setup symlink to .zshrc
if [ -f ~/.vimrc ] || [ -h ~/.vimrc ]; then
  mv ~/.vimrc ~/.vimrc_backup
fi

echo "Creating symlink to ~/.vimrc"
ln -s $DOTFILES/vimrc $HOME/.vimrc
