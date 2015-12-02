#! /bin/zsh

# Usage: ~/.dotfiles/setup/02_php_extensions.sh [php5x]
# If the script argument is omitted, the PHP_EXTENSIONS wil be installed for the PHP_VERSIONS defined

# See list of extensions available here:
# https://github.com/josegonzalez/homebrew-php/tree/master/Formula

set -e
PHP_EXTENSIONS='xdebug memcache memcached apc mcrypt imagick'
PHP_VERSIONS=$(php-installed)

echo_color()
{
    background=${2-'47'}
    foreground=${3-'0;30'}
    echo -e "\033[${foreground}m\033[${background}m$1\033[0m";
}

setup_php_brew() {
    echo -e "Tapping kegs and updating brew..."
    # brew tap josegonzalez/php
    brew tap homebrew/php
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

    IFS=' ' read -ra EXT <<< "$EXT_LIST"
    local i; for i in "${EXT[@]}"; do
        echo -e "\nInstalling $i..."
        brew install $PHP_VER-$i
        echo -e "Done!"
    done
}

# installs all php extensions for each php environment installed
install_php_ext() {
    local EXT_LIST=$1
    local PHP_VER=$2
    local i; IFS=' ' read -ra VER <<< "$PHP_VER"
    for i in "${VER[@]}"; do
        php-switch-osx $i > /dev/null
        install_ext_for_ver "$EXT_LIST" "$i"
    done
}

sanitize_php() {
    local PHP=${1-''}
    IFS=' ' read -ra ALL <<< "$(php-installed)"

    # exit if valid version is supplied
    if [[ ! -z $PHP ]]; then
        for i in ${ALL[@]}; do
            if [[ $i == $PHP ]]; then
                echo $PHP && return
            fi
        done
    fi

    echo $PHP_VERSIONS
}

echo_color "Starting the php extensions installation process...";
install_php_ext "$PHP_EXTENSIONS" "$(sanitize_php $1)"

echo; echo_color 'All done!'

echo -e "\nNOTE: Installing php extensions with homebrew adds files to:\n\t/usr/local/etc/php/%version%/conf.d/ext-%ext_name%.ini\nThese files *are not* removed by homebrew at uninstall, i.e. with 'brew remove %ext_name%'."
