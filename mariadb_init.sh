#!/bin/sh
/usr/bin/mysqld_safe > /dev/null 2>&1 &
mysqladmin --silent --wait=30 ping
mysql -uroot -e "CREATE USER 'root'@'%' IDENTIFIED BY 'secret'"
mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION"
mysql -uroot -e "FLUSH PRIVILEGES"
mysqladmin -uroot shutdown
