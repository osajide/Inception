
FROM debian:bullseye
RUN apt update && apt install mariadb-server -y
COPY tools/database.sh /usr/local/bin/database.sh
RUN chmod +x /usr/local/bin/database.sh
RUN mkdir -p /run/mysqld/
RUN chown -R mysql:mysql /run/mysqld/
CMD [ "database.sh" ]