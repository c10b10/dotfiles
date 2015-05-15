# include the config file if it exists
[[ -f "$HOME/.c10" ]] && . $HOME/.c10

if [[ -z $C10_DOTFILES ]] || [[ ! -d $C10_DOTFILES ]]; then
    echo -e "You must create a ~/.c10 file which exports the variable C10_DOTFILES with the path to the \"dotfiles\" repo.\nExample of ~/.c10:"
    echo -e "\nexport C10_DOTFILES=\$HOME/.dotfiles\n"
    echo -e "If that file exists, make sure the path is correct.\n"
    return
fi

# sanitize to remove the trailing slash
export C10_DOTFILES=${C10_DOTFILES%/}

# Load the environment. Source:
# - the global functions and variables
# - the oh-my-zsh config
. $C10_DOTFILES/shell/global.bash
. $C10_DOTFILES/shell/oh_my_zsh.bash

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Fix SaltStack UTF-8 issue
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
