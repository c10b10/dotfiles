#!/bin/bash

source_if_exists() {
    if [ -f $1 ]
    then
        . $DOTFILES/shell/c10b10.bash
    fi
}

# Load RVM, if you are using it
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
PATH=$PATH:$HOME/.composer/bin:$HOME/.rvm/bin:$DOTFILES/bash_scripts

export WP_CLI_PHP=/Applications/MAMP/bin/php/php5.4.4/bin/php

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Activate bash completion for WP-CLI
autoload bashcompinit
bashcompinit
source_if_exists $HOME/.composer/vendor/wp-cli/wp-cli/utils/wp-completion.bash
