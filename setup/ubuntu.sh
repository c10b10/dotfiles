#!/usr/bin/env bash

# Change the editor to vim
sudo update-alternatives --config editor

# https://www.digitalocean.com/community/articles/how-to-add-and-delete-users-on-ubuntu-12-04-and-centos-6
sudo usermod -aG sudo c10b10
sudo adduser c10b10
sudo /usr/sbin/visudo # And duplicate root line with c10b10

# -a Appends the group to the list of existing groups
# -g would replace the primary group
sudo usermod -aG sudo c10b10

cd /home/c10b10
mkdir .ssh
cd .ssh
ssh-keygen -t rsa -C "alex.ciobica@gmail.com"
eval `ssh-agent -s`
ssh-add

sudo apt-get install zsh

# for ycm
sudo apt-get install build-essential cmake
sudo apt-get install python-dev

sudo add-apt-repository ppa:git-core/ppa
sudo add-apt-repositor ppa:nmi/vim-snapshots
sudo apt-get update
sudo apt-get upgrade

# https://www.digitalocean.com/community/articles/how-to-install-linux-nginx-mysql-php-lemp-stack-on-ubuntu-12-04
# Follow these instructions to install LEMP

# for mysql, i had to change the user back to mysql in the config dile and link it to
sudo ln -s ~/.dotfiles/mysql/my.cnf /etc/mysql/my.cnf






























