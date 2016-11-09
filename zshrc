# zsh reads your config files in the following order:
# 1. ~/.zshenv: Defines env variables, and global helpers
# 2. ~/.zshrc: Aliases, shell options, keybinding, functions
# 3. ~/.zpreztorc: Configures prezto
# 4. ~/.zlogin: Greetings or creation of files

# Autoload functions
# - async: needed by the shell theme
# - source_if_exists: helper function
autoload -Uz async source_if_exists && async

# Source Prezto.
source_if_exists $HOME/.zprezto/init.zsh

# Source z. https://github.com/rupa/z
source $C10_DOTFILES/zmodules/z-zsh/z.sh

# Disable autocorrection, needs to be done after prezto init
unsetopt CORRECT

# Aliases
alias suas="sudo su -s /bin/bash -"
alias zreboot="exec zsh"

# Setting PATH changes in .zshenv will not work properly

export PATH=/usr/local/sbin:/Applications/MAMP/bin/php/php7.0.0/bin:/usr/local/bin:$C10_DOTFILES/bin:$PATH

# RVM
if [ -f $HOME/.rvm/bin/rvm-prompt ]; then
    [[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
    export PATH=$PATH:$HOME/.rvm/bin
fi

# Python
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
    export WORKON_HOME=$HOME/.virtualenvs
fi

# Node
if command -v node >/dev/null 2>&1; then
    # Localize Node/NPM
    NPM_PACKAGES="$HOME/.npm-packages"
    PATH="$NPM_PACKAGES/bin:$PATH"
    unset MANPATH
    MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
    NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
fi

