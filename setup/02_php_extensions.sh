#!/usr/bin/env bash
set -e

# See list: https://github.com/josegonzalez/homebrew-php/tree/master/Formula

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

# installs extensions for a certain version
install_ext_for_ver() {
    local EXT_LIST=$1
    local PHP_VER=$2

    echo; echo_color "Installing $PHP_VER extensions..."

    IFS=',' read -ra EXT <<< "$EXT_LIST"
    for i in "${EXT[@]}"; do
        echo -e "\nInstalling $i..."
        brew install $PHP_VER-$i
        echo -e "Done!"
    done
}

# installs all php extensions for each php environment installed
install_php_ext() {
    local EXT_LIST=$1
    local PHP_CURR=$(php-current-version)
    IFS=' ' read -ra VER <<< "$(php-installed)"
    for i in "${VER[@]}"; do
        php-switch-osx $i > /dev/null
        install_ext_for_ver $EXT_LIST $i
    done
}

echo_color "Starting the php extensions installation process...";
install_php_ext "xdebug,mcrypt"
echo; echo_color 'All done!'

echo -e "\nNOTE: Installing php extensions with homebrew adds files to:\n\t/usr/local/etc/php/%version%/conf.d/ext-%ext_name%.ini\nThese files *are not* removed by homebrew at uninstall, i.e. with 'brew remove %ext_name%'."
