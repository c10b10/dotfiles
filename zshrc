# My dotfiles
# TODO This always needs to be edited depending on the path of the dotfiles
export DOTFILES=$HOME/bin/dotfiles
export C10_DOTFILES=$DOTFILES
export C10_SCRIPTS=$C10_DOTFILES/bin

# Load the environment. Source:
# - the global functions and variables
# - the oh-my-zsh config
# - the aliases and helpers
. $DOTFILES/
. $DOTFILES/shell/global.bash
. $DOTFILES/shell/oh_my_zsh.bash
source_if_exists $DOTFILES/shell/c10b10.bash

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
