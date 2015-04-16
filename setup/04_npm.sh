#!/usr/bin/env bash

set -e

echo_color()
{
    background=${2-'47'}
    foreground=${3-'0;30'}
    echo -e "\033[${foreground}m\033[${background}m$1\033[0m";
}

setup_brew() {
    echo -e "Updating brew..."
    brew update
    brew tap --repair
    echo -e "Done!\n"
}

install_node() {
    local PHP=$1
    echo -e "Installing node ..."
    brew install node
    echo -e "Done!\n"
}

echo_color "Starting the installation process..."; echo
setup_brew
install_node

echo; echo_color 'All done!'
