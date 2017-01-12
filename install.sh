#! /bin/zsh

# Terminate on error
set -e

# Include utils
scriptpath=`dirname "$0"` scriptpath=`cd "$scriptpath" && pwd`
source ${scriptpath}/setup/lib/util.sh

symlinks=( \
    'ackrc' \
    'agignore' \
    'vimrc' \
    'vim' \
    'npmrc' \
    'gitignore' \
    'gitconfig' \
    # 'zlogin' \
    # 'zshenv' \
    # 'zshrc' \
    # 'zmodules/zprezto' \
    # 'zpreztorc' \
)

# Changes shell to zsh
change_shell_to_zsh() {
    if [[ $SHELL != *"zsh" ]]; then
        echo_color "Changing shell to zsh..."
        chsh -s `which zsh`
    fi
}

setup_fish() {
    echo_color "Installing fish config..."
    rm -rf $HOME/.config/fish
    echo_color "Linking config file to ${HOME}/.config/fish..."
    ln -fs $dotpath/fish $HOME/.config/fish
    echo_color "Done. Make sure fish is installed by running setup/fish.sh..."
}

link_config_files() {
    echo_color "Initializing repo submodules..."
    pushd $dotpath &> /dev/null
    git submodule update --init --recursive
    popd
    echo_done

    echo_color "Linking config files..."
    for file in "${symlinks[@]}"; do
        # http://stackoverflow.com/questions/9532654/bash-expression-after-last-specific-character
        echo "Linking $file to $HOME/.${file##*/}"
        rm -rf $HOME/.$file
        ln -fs $dotpath/$file $HOME/.${file##*/}
    done
    echo_done
}


# Load utils
dotpath=`dirname "$0"` dotpath=`cd "$dotpath" && pwd`
source ${dotpath}/setup/lib/util.sh $0

setup_fish

# Create symlinks for the config files
link_config_files

echo_royal_suggestion "You might want to replace the user information in ~/.gitconfig."
fin
