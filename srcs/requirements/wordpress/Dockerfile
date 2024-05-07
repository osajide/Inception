
# FROM debian:bullseye as first
# RUN apt update && apt install -y wget unzip
# RUN mkdir -p /var/www/html
# RUN wget https://wordpress.org/latest.zip \
# 	&& unzip latest.zip -d /var/www/html \
# 	&& rm latest.zip

# FROM debian:bullseye
# RUN apt update && apt install -y mariadb-client curl
# COPY --from=first /var/www/html/* /var/www/html/
# COPY tools/setup.sh /scripts/setup.sh
# COPY tools/init.sh /scripts/init.sh
# RUN chmod u+x /scripts/init.sh && chmod u+x /scripts/setup.sh
# RUN apt update && apt install -y php-fpm php-mysql
# RUN mkdir /content
# RUN mkdir -p /run/php
# RUN sed -i "s/\/run\/php\/php7.4-fpm.sock/0.0.0.0:9000/" /etc/php/7.4/fpm/pool.d/www.conf
# CMD [ "./scripts/init.sh" ]

FROM debian:bullseye
RUN apt update && apt install -y curl mariadb-client php-fpm php-mysql
COPY tools/setup.sh /usr/local/bin/setup.sh
RUN chmod +x /usr/local/bin/setup.sh
RUN mkdir -p /run/php
RUN sed -i "s/\/run\/php\/php7.4-fpm.sock/0.0.0.0:9000/" /etc/php/7.4/fpm/pool.d/www.conf
CMD [ "setup.sh" ]