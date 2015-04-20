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

# ==Local scrips
export PATH=/usr/local/sbin:/usr/local/bin:$C10_DOTFILES/bin:$PATH

# ==RVM
if [ -f ~/.rvm/bin/rvm-prompt ]; then
    [[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
    export PATH=$PATH:$HOME/.rvm/bin
fi

# ==Python
export WORKON_HOME=$HOME/.virtualenvs

# =z-zsh https://github.com/sjl/z-zsh
if [ -f $C10_DOTFILES/z-zsh/z.sh ]; then
    . $C10_DOTFILES/z-zsh/z.sh
    function precmd () {
        z --add "$(pwd -P)"
    }
    C10_ENV="$C10_ENV,z-zsh:true"
fi

# ==node
if command -v node >/dev/null 2>&1; then
    # Localize Node/NPM
    NPM_PACKAGES="$HOME/.npm-packages"
    PATH="$NPM_PACKAGES/bin:$PATH"
    unset MANPATH
    MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
    NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
fi
