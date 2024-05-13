FROM debian:bullseye
RUN apt update; apt install vsftpd -y
RUN useradd -m test && echo "test:salam" | chpasswd
RUN sed -i "s/#write_enable=YES/write_enable=YES/" /etc/vsftpd.conf
RUN mkdir -p /var/run/vsftpd/empty
CMD [ "vsftpd" ]