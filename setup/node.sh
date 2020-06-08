#! /bin/zsh

# Terminate on error
set -e

# Include utils
scriptpath=`dirname "$0"` scriptpath=`cd "$scriptpath" && pwd`
source ${scriptpath}/lib/util.sh

setup_brew() {
    echo_color "Updating brew..."
    brew update
    brew tap --repair
    echo_done
}

install_node() {
    echo_color "Installing node..."
    brew install node
    echo_done
}

echo_color "Starting the installation process..."; echo -e
setup_brew
install_node

royal_fin
