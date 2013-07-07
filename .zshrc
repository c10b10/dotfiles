# My dotfiles
export DOTFILES=$HOME/bin/dotfiles

# Source the environment variables
. $DOTFILES/bash/env.bash

# Source the oh-my-zsh config
. $DOTFILES/bash/oh_my_zsh.bash

# Source my aliases and scripts
. $DOTFILES/bash/c10b10.bash

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Activate bash completion for WP-CLI
autoload bashcompinit
bashcompinit
source ~/.composer/vendor/wp-cli/wp-cli/utils/wp-completion.zsh
