#!/bin/bash

# = TIPS

# ==See the config load order
# mysqld --verbose --help | grep -A 1 "Default options"


# ==Save the installed mysql version in a var
# path=/usr/local/Cellar/mysql
# MYSQL_VERSION="$(ls $path)"
# echo $MYSQL_VERSION

echo_color()
{
    background=${2-'47'}
    foreground=${3-'0;30'}
    echo -e "\033[${foreground}m\033[${background}m$1\033[0m";
}

setup_mysql_brew() {
    echo_color "1. Updating homebrew and its formulas..."
    brew update
    brew upgrade
    echo_color "1. Done!"
}


install_mysql() {
    # http://blog.joefallon.net/2013/10/install-mysql-on-mac-osx-using-homebrew/

    echo_color "2. Installing mysql with homebrew..."
    brew install mysql --enable-debug
    echo_color "2. Done!"
}

secure_mysql() {
    echo_color "3. Secure the mysql setup..."
    sudo mysql_secure_installation
    echo_color "3. Done!"
}

link_config() {
    # Default options are read from the following files in the given order:
    # /etc/my.cnf /etc/mysql/my.cnf /usr/local/etc/my.cnf ~/.my.cnf
    echo_color "4. Setting up the mysql config..."
    mysql-deploy-conf 'false'
    echo_color "4. Done!"
}

add_user() {
    echo_color "5. Adding permission to the current user."
    echo -e "Currently, you can only log in to mysql using the root user (i.e. mysql -uroot -p), unless you allowed anonymous login, in which case you should answer no to the next question.\n"

    read -p "Do you want to add access for user `whoami` (you will be allowed to login by typing 'mysql' and login without any password)? [y/n] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        read -s -p "Your mysql root password: " mysqlpass
        mysql -uroot -p$mysqlpass -e "DROP USER '`whoami`'@'localhost';" 2> /dev/null
        mysql -uroot -p$mysqlpass -e "CREATE USER '`whoami`'@'localhost'; GRANT ALL PRIVILEGES ON *.* TO '`whoami`'@'localhost'"

    else
        echo -e '\nYou will only be allowed to login to mysql using root (i.e.: mysql -uroot -p), unless you kept anonymous login.'
    fi
    echo_color "5. Done!"
}

pkill -f mysql
set -e
setup_mysql_brew
install_mysql
mysql.server start
secure_mysql
set +e
add_user

echo_color "\nAll done!"

