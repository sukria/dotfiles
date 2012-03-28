#!/bin/bash

set -e

make install

cd
rm -f .bashrc && ln -s .dotfiles/bash/bashrc .bashrc
rm -f .vimrc && ln -s .dotfiles/vim/vimrc .vimrc
rm -f .gitconfig && ln -s .dotfiles/git/gitconfig .gitconfig
