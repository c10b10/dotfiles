#!/bin/bash
set -e

# brew update
# brew doctor
# brew upgrade

# http://blog.joefallon.net/2013/10/install-mysql-on-mac-osx-using-homebrew/

# brew install mysql --enable-debug
# mysql.server restart
# sudo mysql_secure_installation

# Allow MySQL to run under your user account
# unset TMPDIR
# mysql_install_db --verbose --user=`whoami` \\
# --basedir="$(brew --prefix mysql)" \\
# --datadir=/usr/local/var/mysql --tmpdir=/tmp

# Default options are read from the following files in the given order:
# /etc/my.cnf /etc/mysql/my.cnf /usr/local/etc/my.cnf ~/.my.cnf
echo $C10_DOTFILES
sudo ln -s $C10_DOTFILES/mysql/my.cnf /etc/my.cnf

# = TIPS

# ==See the config load order
# mysqld --verbose --help | grep -A 1 "Default options"


# ==Save the installed mysql version in a var
# path=/usr/local/Cellar/mysql
# MYSQL_VERSION="$(ls $path)"
# echo $MYSQL_VERSION
