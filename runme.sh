#!/bin/bash

set -e

make install

rm -f ~/.bashrc && ln -vs $(pwd)/bash/bashrc ~/.bashrc
rm -f ~/.vimrc && ln -vs $(pwd)/vim/vimrc ~/.vimrc
rm -f ~/.gitconfig && ln -vs $(pwd)/git/gitconfig ~/.gitconfig

VIMDIR="$HOME/.vim"

if [ -e "$VIMDIR" ]; then
    rm -f $VIMDIR
fi

if [ -d "$VIMDIR" ]; then
    echo "***"
    echo "*** WARNING: $VIMDIR exists, backing it up to $HOME/.vim.old"
    echo "***"
    mv $VIMDIR $HOME/.vim.old
fi

ln -vs $(pwd)/vim/vim-homedir $VIMDIR
