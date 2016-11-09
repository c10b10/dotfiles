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

