#!/bin/bash

. $HOME/.c10

rm -rf $HOME/.vim

readarray <<HERE
ackrc
agignore
vimrc
vim
zshrc
npmrc
gitignore
HERE

echo "$C10_DOTFILES"
for file in "${MAPFILE[@]}"; do
  # remove trailing new line
  cleanfile=$(echo -n $file)
  rm -rf $HOME/.$cleanfile
  ln -fs $C10_DOTFILES/$cleanfile $HOME/.$cleanfile
done
