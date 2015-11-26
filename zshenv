#
# Executes commands at login pre-zshrc.
#

# Variables
# ---------

# Add path to my dotfiles
# DO NOT ADD A TRAILING SLASH!
export C10_DOTFILES=$HOME/.dotfiles

# Add my functions for autoload
fpath=($C10_DOTFILES/zfunc $fpath)

# Fix SaltStack UTF-8 issue
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

export PAGER='less'
export LESS='-R'

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Temporary Files
if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$LOGNAME"
  mkdir -p -m 700 "$TMPDIR"
fi

# Local Scripts
export PATH=/usr/local/sbin:/usr/local/bin:$C10_DOTFILES/bin:$PATH

# RVM
if [ -f $HOME/.rvm/bin/rvm-prompt ]; then
    [[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
    export PATH=$PATH:$HOME/.rvm/bin
fi

# Python
export WORKON_HOME=$HOME/.virtualenvs

# Node
if command -v node >/dev/null 2>&1; then
    # Localize Node/NPM
    NPM_PACKAGES="$HOME/.npm-packages"
    PATH="$NPM_PACKAGES/bin:$PATH"
    unset MANPATH
    MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
    NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
fi
