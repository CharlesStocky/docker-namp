#!/bin/sh

VOLUME_HOME="/var/lib/mysql"

if [[ ! -d $VOLUME_HOME/mysql ]]; then
    mysql_install_db > /dev/null 2>&1
    sh /usr/local/bin/mariadb_init.sh
fi

exec mysqld_safe
