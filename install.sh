#!/bin/bash

. $HOME/.dotfiles/c10

rm -rf $HOME/.vim

readarray <<HERE
c10
ackrc
agignore
vimrc
vim
zshrc
npmrc
gitignore
HERE

for file in "${MAPFILE[@]}"; do
  # remove trailing new line
  echo "Linking $cleanfile to $HOME/.$cleanfile"
  cleanfile=$(echo -n $file)
  rm -rf $HOME/.$cleanfile
  ln -fs $C10_DOTFILES/$cleanfile $HOME/.$cleanfile
done
