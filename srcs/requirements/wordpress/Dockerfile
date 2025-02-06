
FROM	debian:bullseye
RUN	apt update && apt install -y curl mariadb-client php-fpm php-mysql php-redis
COPY	tools/setup.sh /usr/local/bin/setup.sh
RUN	chmod +x /usr/local/bin/setup.sh
RUN	mkdir -p /run/php
RUN	sed -i "s/\/run\/php\/php7.4-fpm.sock/0.0.0.0:9000/" /etc/php/7.4/fpm/pool.d/www.conf
RUN	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp && chmod +x /usr/local/bin/wp
WORKDIR	/temp/wordpress
RUN	wp core download --allow-root
CMD [ "setup.sh" ]
