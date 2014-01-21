#!/bin/bash
set -e

brew tap josegonzalez/php
brew tap homebrew/dupes

echo 'Updating homebrew'
brew update
brew tap --repair

# Install PHP
brew install php53 --with-mysql --with-debug
brew install php54 --with-mysql --with-debug

# Install composer
# https://github.com/composer/composer
