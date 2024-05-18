FROM debian:bullseye
RUN apt update && apt install redis-server -y
RUN sed -i "s/bind 127.0.0.1 ::1/bind 0.0.0.0 ::/" /etc/redis/redis.conf &&\
	sed -i "s/daemonize yes/daemonize no/" /etc/redis/redis.conf &&\
	sed -i "s/#write_enable=YES/write_enable=YES/" /etc/redis/redis.conf
CMD [ "/etc/init.d/redis-server", "restart", "/etc/redis/redis.conf" ]