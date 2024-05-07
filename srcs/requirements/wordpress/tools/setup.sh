#!/bin/bash

while ! mariadb -u $DB_USER -p$DB_PASS -h mariadb -e "use $DB_NAME"; do
	sleep 2
done

# curl -O https://wordpress.org/latest.zip
# unzip -d /var/www/html latest.zip
# rm latest.zip

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
chmod +x /usr/local/bin/wp

cd /var/www/html/
wp core download --allow-root

wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=mariadb --allow-root

wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_PASS --admin_email=$WP_EMAIL --allow-root

wp user create $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASS --role=author --allow-root

exec php-fpm7.4 -F