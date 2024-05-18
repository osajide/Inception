
FROM debian:bullseye
RUN apt update; apt install vsftpd -y
COPY tools/ftp.sh /usr/local/bin/ftp
RUN chmod +x /usr/local/bin/ftp
CMD [ "ftp" ]