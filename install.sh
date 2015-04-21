#!/bin/bash

. $HOME/.c10

rm -rf $HOME/.vim

readarray <<HERE
ackrc
agignor
vimrc
vim
zshrc
npmrc
gitignore
HERE

for file in "${MAPFILE[@]}"; do
  # remove trailing new line
  cleanfile=$(echo -n $file)
  ln -fs $C10_DOTFILES/$cleanfile $HOME/.$cleanfile
done
