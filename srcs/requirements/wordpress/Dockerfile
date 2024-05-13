
FROM debian:bullseye
RUN apt update && apt install -y wget curl mariadb-client php-fpm php-mysql php-redis
COPY tools/setup.sh /usr/local/bin/setup.sh
RUN chmod +x /usr/local/bin/setup.sh
RUN mkdir -p /run/php
RUN sed -i "s/\/run\/php\/php7.4-fpm.sock/0.0.0.0:9000/" /etc/php/7.4/fpm/pool.d/www.conf
WORKDIR /var/www/html/adminer/
RUN wget -O adminer.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php
CMD [ "setup.sh" ]