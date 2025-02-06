#!/bin/bash

set -xe

service mariadb start

mariadb -e "create database $DB_NAME;
create user '$DB_USER'@'%' identified by '$DB_PASS';
grant all privileges on $DB_NAME.* to '$DB_USER'@'%' identified by '$DB_PASS';
flush privileges;"

sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf

service mariadb stop

exec mysqld
