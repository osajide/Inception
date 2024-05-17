FROM debian:bullseye
RUN apt update && apt install python3 -y
COPY html/index.html /mysite/index.html
COPY tools/site.sh /usr/local/bin/site
RUN chmod +x /usr/local/bin/site
CMD [ "site" ]