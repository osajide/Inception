
FROM debian:bullseye
RUN apt update && apt install mariadb-server -y
COPY tools/database.sh /usr/local/bin/database.sh
RUN chmod +x /usr/local/bin/database.sh
RUN mkdir -p /run/mysqld/
RUN chown -R mysql:mysql /run/mysqld/
# RUN sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf
# RUN sed -i "s/socket = \/run\/mysqld\/mysqld.sock/port = 3306/" /etc/mysql/my.cnf
CMD [ "database.sh" ]