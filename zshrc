# My dotfiles

[[ -f "$HOME/.c10" ]] && . $HOME/.c10
if [[ -z $C10_DOTFILES ]] || [[ ! -d $C10_DOTFILES ]]; then
    echo -e "You must create a ~/.c10 file which exports the variable C10_DOTFILES with the path to the \"dotfiles\" repo.\nExample of ~/.c10:"
    echo -e "\nexport C10_DOTFILES=\$HOME/.dotfiles\n"
    echo -e "If that file exists, make sure the path is correct.\n"
    return
fi

export C10_SCRIPTS=$C10_DOTFILES/bin

# Load the environment. Source:
# - the global functions and variables
# - the oh-my-zsh config
# - the aliases and helpers
. $C10_DOTFILES/
. $C10_DOTFILES/shell/global.bash
. $C10_DOTFILES/shell/oh_my_zsh.bash
source_if_exists $C10_DOTFILES/shell/c10b10.bash

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
