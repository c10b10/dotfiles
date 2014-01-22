#!/bin/bash
set -e

# See the location of your httpd.conf
# apachectl -V | grep "httpd.conf"

backup_initial_config() {
    config_file=$(sudo httpd -V | grep SERVER_CONFIG_FILE | cut -d'"' -f2)
    bk_file=$(dirname $config_file)/httd.conf-bk
    sudo mv $config_file $bk_file
    echo -e "Backed up old config file to $bk_file"
}
# copy the config file

bakup_initial_config
deploy_apache_conf


echo -e "Setting up your deful vhosts file at $C10_DOTFILES/apache/httpd-vhosts.conf..."
set +e
cp -n httpd-vhosts-template.conf httpd-vhosts.conf

echo 'You should edit the config file (vim $C10_DOTFILES/apache/httpd.conf) by searching for "#c10" and then redeploy (deploy_apache_conf)'

echo -e "\nAll done!"

#phpcodesniffer
