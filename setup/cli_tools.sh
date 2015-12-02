#! /bin/zsh

# Include utils
scriptpath=`dirname "$0"` scriptpath=`cd "$scriptpath" && pwd`
source ${scriptpath}/lib/util.sh $0

# Homebrew
# ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Change permissions to avoid permissions errors on brew update
sudo chown -R $USER /usr/local
brew update
brew tap homebrew/dupes

# Install formulae
# brew install ctags-exuberant
brew install ack
brew install the_silver_searcher
brew install cmake
brew install git
brew install tree
brew install openssl
brew install wget
brew install pstree
brew install htop
brew install rsync
brew install caskroom/cask/brew-cask

brew doctor

royal_fin
