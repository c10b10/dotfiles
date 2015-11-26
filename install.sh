#!/bin/bash

symlinks=( \
    'ackrc' \
    'agignore' \
    'vimrc' \
    'vim' \
    'npmrc' \
    'gitignore' \
    'zlogin' \
    'zshenv' \
    'zshrc' \
    'zmodules/zprezto' \
    'zpreztorc' \
)

echo "Initializing submodules"
git submodule update --init --recursive

for file in "${symlinks[@]}"; do
  # http://stackoverflow.com/questions/9532654/bash-expression-after-last-specific-character
  echo "Linking $file to $HOME/.${file##*/}"
  rm -rf $HOME/.$file
  ln -fs $C10_DOTFILES/$file $HOME/.${file##*/}
done
