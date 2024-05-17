#!/bin/bash

mkdir -p /var/www/html/adminer
cd /var/www/html/adminer
wget -O index.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php
exec php-fpm7.4 -F