#!/bin/bash
set -e

# Homebrew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

# TIP: `man brew` & `brew options %formula%`

# Install formulae
brew install ack
brew install the_silver_searcher
brew install cmake
brew install ctags-exuberant
brew install git
brew install hub
brew install tree
brew install openssl
brew install wget
brew install pstree
brew install htop

# change permissions to avoid permissions errors on brew update
sudo chown -R $USER /usr/local

# de control
brew update

brew doctor
