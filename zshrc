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

# Aliases
alias suas="sudo su -s /bin/bash -"
