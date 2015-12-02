#! /bin/zsh

# http://blog.frd.mn/install-nginx-php-fpm-mysql-and-phpmyadmin-on-os-x-mavericks-using-homebrew/

set -e

# Include utils
scriptpath=`dirname "$0"` scriptpath=`cd "$scriptpath" && pwd`
source ${scriptpath}/lib/util.sh $0

install_nginx() {
    echo_color "1. Installing nginx..."
    brew install nginx
    mkdir -p /usr/local/etc/nginx/logs
    mkdir -p /usr/local/etc/nginx/enabled
    mkdir -p /usr/local/etc/nginx/ssl
    echo_done
}

backup_initial_config() {
    config_file=$(nginx-conf-path)
    bk_file=$(dirname $config_file)/nginx.conf-bk
    sudo mv $config_file $bk_file
    echo_color "2. Backed up old config file to $bk_file!"
}

setup_sample_vhost() {
    local dir=$1
    local config_file=$(nginx-conf-path)

    sudo ln -sf $dir/vhosts $(dirname $config_file)/enabled
    echo_color "Linked the vhosts directory from $dir/vhosts to $(dirname $config_file)/enabled!"
}

install_nginx
backup_initial_config
nginx-deploy-conf

sudo ln -sf /usr/local/opt/nginx/homebrew.mxcl.nginx.plist ~/Library/LaunchAgents

setup_sample_vhost $C10_DOTFILES/nginx

royal_fin

#phpcodesniffer
