#!/bin/bash

mkdir -p /content/html/
mv /var/www/html/* /content/html/
./scripts/setup.sh
exec php-fpm7.4 -F