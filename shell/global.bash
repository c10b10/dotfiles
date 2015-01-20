#!/bin/bash

# =Global helpers

source_if_exists() {
    if [ -f $1 ]
    then
        . $1
    fi
}

# =Environment variables

C10_ENV=""

# TODO
# echo $PATH reveals that there are duplicates in the PATH. WHY?
# Also, don't include these paths if the tools aren't installed.

# ==Local scrips
export PATH="/usr/local/bin:$C10_DOTFILES/bin:$PATH"

# ==RVM
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
export PATH=$PATH:$HOME/.rvm/bin

# ==Heroku
export PATH="/usr/local/heroku/bin:$PATH"

# ==MAMP
if [ -d "/Applications/MAMP/" ]; then
    export PATH="/Applications/MAMP/Library/bin:$PATH"
fi

# ==Local super scripts
export PATH="/usr/local/sbin:$PATH"

# ==Python

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source_if_exists /usr/local/bin/virtualenvwrapper.sh

# =z-zsh https://github.com/sjl/z-zsh

if [ -f $C10_DOTFILES/z-zsh/z.sh ]; then
    . $C10_DOTFILES/z-zsh/z.sh
    function precmd () {
        z --add "$(pwd -P)"
    }
    C10_ENV="$C10_ENV,z-zsh:true"
else
	C10_ENV="$C10_ENV,z-zsh:false"
fi

# ==wp-cli

export WP_CLI_PHP=/usr/local/Cellar/php54/5.4.28/bin/php
# export WP_CLI_PHP_ARGS="-c $C10_DOTFILES/php/php54.ini"

# ===Activate bash completion for WP-CLI
autoload bashcompinit
bashcompinit
source_if_exists $HOME/.composer/vendor/wp-cli/wp-cli/utils/wp-completion.bash

# ==node

if [[ $(brew list | grep node) == 'node' ]]; then
    # Localize Node/NPM
    NPM_PACKAGES="$HOME/.npm-packages"
    PATH="$NPM_PACKAGES/bin:$PATH"
    unset MANPATH
    MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
    NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
fi

export TESSDATA_PREFIX="/usr/local/Cellar/tesseract/3.02.02/share"
