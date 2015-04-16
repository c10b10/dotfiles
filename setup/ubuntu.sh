#!/usr/bin/env bash
set -e

# Change the editor to vim
sudo update-alternatives --config editor

read -e -p "Type the name of the new unix user: " NEW_USER

setup_unix_user() {
    # https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-14-04
    adduser $NEW_USER
    gpasswd -a $NEW_USER sudo

    echo -e "User ${NEW_USER} created with sudo privileges."
}

setup_user_ssh() {
    # https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-14-04
    su - $NEW_USER
    cd /home/${NEW_USER}
    mkdir .ssh
    chmod 700 .ssh
    # Create rsa key
    cd .ssh
    read -e -p "Type the e-mail used for the ssh key generation: " EMAIL
    ssh-keygen -t rsa -C $EMAIL
    eval `ssh-agent -s`
    ssh-add
    # Create authorized keys
    touch .ssh/authorized_keys
    echo -e "\n1. Add your public key to /home/${NEW_USER}/authorized_keys"
    echo -e "\n2. Restrict root login by setting PermitRootLogin to no in /etc/ssh/sshd_config"
}

install_zsh() {
    sudo apt-get install zsh
}

install_latest_vim() {
    sudo add-apt-repository ppa:nmi/vim-snapshots
    sudo apt-get update
    sudo apt-get install vim

    # for YouCompleteMe
    # sudo apt-get install build-essential cmake
    # sudo apt-get install python-dev
}

install_git() {
    # http://stackoverflow.com/questions/19109542/installing-latest-version-of-git-in-ubuntu
    sudo add-apt-repository ppa:git-core/ppa
    sudo apt-get update
    sudo apt-get install git
    git --version

    echo -e "\nInstalled latest version of git."
}

install_nginx() {
    # https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-14-04-lts

    sudo apt-get update
    sudo apt-get install nginx

    echo -e "\nInstalled nginx. Check out https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-14-04-lts for more instructions."
}
