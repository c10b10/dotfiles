#!/usr/bin/env bash

# Instructions: http://mac-dev-env.patrickbougie.com/memcached/

set -e

# TODO Seems that php5x-memecached extension instsalls the brew as well... huh?
function get_memcached() {
    local VER=$1
    local FILE="memcached-${VER}"
    cd /tmp/
    curl --remote-name http://www.memcached.org/files/${FILE}.tar.gz

    if [[ ! -z $(cat ${FILE}.tar.gz | grep 'not found') ]]; then
        echo "Memcache $VER"
        rm -rf ${FILE}.tar.gz
        exit 1
    fi

    tar -xzvf ${FILE}.tar.gz
    cd $FILE

    ./configure \
        --prefix=/usr/local/${FILE} \
        --with-libevent=/usr/local/libevent
    make
    make install
}

read -p "Memcached version (See: http://memcached.org/): " MEM_VER

get_memcached $MEM_VER
