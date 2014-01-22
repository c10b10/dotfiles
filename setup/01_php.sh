#!/usr/bin/env bash

set -e

echo_color()
{
    background=${2-'47'}
    foreground=${3-'0;30'}
    echo -e "\033[${foreground}m\033[${background}m$1\033[0m";
}

setup_php_brew() {
    echo -e "Tapping kegs and updating brew..."
    brew tap josegonzalez/php
    brew tap homebrew/dupes
    brew update
    brew tap --repair
    echo -e "Done!\n"
}

install_php() {
    echo -e "Installing phps..."
    brew install php53 --with-mysql --with-imap --with-debug
    brew install php54 --with-mysql --with-imap --with-debug
    echo -e "Done!\n"
}

echo_color "Starting the php installation process..."; echo

setup_php_brew
install_php
php-switch-osx 'php53' > /dev/null

echo -e "\nYou are now using php53."
echo -e "\nYou can switch php versions using 'php-switch-osx [php5x]'."

echo; echo_color 'All done!'

# Install composer
# https://github.com/composer/composer
