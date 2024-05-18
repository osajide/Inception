#!/bin/bash

useradd $FTP_USER && echo "$FTP_USER:$FTP_PASS" | chpasswd
usermod -d /var/www/html $FTP_USER
sed -i "s/#write_enable=YES/write_enable=YES/" /etc/vsftpd.conf
mkdir -p /var/run/vsftpd/empty
exec vsftpd