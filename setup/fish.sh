#! /bin/zsh

# Include utils
scriptpath=`dirname "$0"` scriptpath=`cd "$scriptpath" && pwd`
source ${scriptpath}/lib/util.sh $0

# Homebrew
# ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Change permissions to avoid permissions errors on brew update
sudo chown -R $USER /usr/local
brew update
brew install fish
which fish | sudo tee -a /etc/shells
chsh -s `which fish`

echo $C10_DOTFILES
# Install the theme
brew install staship
# Install fisher
# Install fish package manager
curl https://git.io/fisher --create-dirs -sLo $C10_DOTFILES/fish/functions/fisher.fish
fish -c fisher

royal_fin
