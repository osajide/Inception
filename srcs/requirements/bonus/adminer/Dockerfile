FROM debian:bullseye
RUN apt update; apt install -y php-fpm wget php-mysql
RUN mkdir -p /run/php
RUN sed -i "s/\/run\/php\/php7.4-fpm.sock/0.0.0.0:9000/" /etc/php/7.4/fpm/pool.d/www.conf
COPY tools/adminer.sh /usr/local/bin/adminer
RUN chmod +x /usr/local/bin/adminer
CMD [ "adminer" ]