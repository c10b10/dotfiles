# My dotfiles
export DOTFILES=$HOME/bin/dotfiles

# Source the environment variables
. $DOTFILES/shell/env.bash

# Source the oh-my-zsh config
. $DOTFILES/shell/oh_my_zsh.bash

# Source my aliases and scripts
if [ -f $1 ]
then
    . $DOTFILES/shell/c10b10.bash
fi
source_if_exists $DOTFILES/shell/c10b10.bash
