#!/bin/bash
set -e

# See the location of your httpd.conf
# apachectl -V | grep "httpd.conf"

# copy the config file
mv -rf /private/etc/apache2/httpd.conf /private/etc/apache2/httpd-bk.conf
cp ../setup/apache/httpd.conf /private/etc/apache2/httpd.conf

#TODO
#PHP ini
#mysql
#phpmyadmin
#commands of starting / restarting
#commands of php log
#phpcodesniffer
