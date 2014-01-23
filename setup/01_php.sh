#!/usr/bin/env bash

set -e

DEFAULT_DESIRED_PHP='php53 php54'

echo_color()
{
    background=${2-'47'}
    foreground=${3-'0;30'}
    echo -e "\033[${foreground}m\033[${background}m$1\033[0m";
}

# Returns the available php versions
available_php_versions() {
    local AV_PHP=$(brew search php | grep '^php[0-9]\{2\}$')
    echo ${AV_PHP//$'\n'/' '}
}

pretty_php_version() {
    local PHP=$1
    echo $(brew info --all $1 | grep 'pear config-set' | cut -d / -f 6)
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
    local PHP=$1
    echo -e "Installing PHP $(pretty_php_version $PHP)..."
    echo "brew install $PHP --with-mysql --with-imap --with-debug"
    echo -e "Done!\n"
}

sanitize() {
    local PHP=${1-''}
    local AV_PHP=$(available_php_versions)

    # exit if valid version is supplied
    IFS=' ' read -ra ALL <<< "$AV_PHP"
    if [[ ! -z $PHP ]]; then
        for i in ${ALL[@]}; do
            if [[ $i == $PHP ]]; then
                echo $PHP && return
            fi
        done
    fi

    echo $DEFAULT_DESIRED_PHP
}

echo_color "Starting the php installation process..."; echo
# setup_php_brew

IFS=' ' read -ra WHAT <<< $(sanitize ${1-''})
for i in "${WHAT[@]}"; do
    install_php $i
done

php-switch-osx > /dev/null
echo -e "\nYou are using using $(php -r 'echo phpversion();' | cut -d . -f 1-2)."
echo -e "\nYou can switch php versions using 'php-switch-osx [php5x]'."

echo; echo_color 'All done!'

# Install composer
# https://github.com/composer/composer
