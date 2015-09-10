#!/bin/bash
set -e

# TIP: `man brew` & `brew options %formula%`
brew update

# Install formulae
brew install ack
brew install the_silver_searcher
brew install git
brew install hub
brew install tree
brew install openssl
brew install wget
brew install pstree
brew install htop
brew install mackup
brew install cmake
brew install ctags-exuberant

# change permissions to avoid permissions errors on brew update
sudo chown -R $USER /usr/local

brew doctor
