#!/bin/bash

while ! mariadb -u $DB_USER -p$DB_PASS -h $DB_HOST -e "use $DB_NAME"; do
	sleep 2
done

if [ ! -f "/var/www/html/wp-config.php" ]; then
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp
	chmod +x /usr/local/bin/wp

	cd /var/www/html/
	wp core download --allow-root

	wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=$DB_HOST --allow-root
	wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$ADMIN_WP_USER --admin_password=$ADMIN_WP_PASS --admin_email=$ADMIN_WP_EMAIL --allow-root
	wp user create $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASS --role=$WP_USER_ROLE --allow-root

	chown -R www-data:www-data .
	chmod -R o+w /var/www/html/  		# grant write perm to other
	wp plugin install redis-cache --activate --allow-root
	wp config set WP_REDIS_HOST redis --allow-root
	wp redis enable --allow-root

fi
exec php-fpm7.4 -F
