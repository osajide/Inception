
FROM debian:bullseye as first
WORKDIR /certificate
RUN apt update && apt install openssl -y
RUN openssl genrsa -out prv.key 2048
RUN openssl req -new -key prv.key -subj "/C=MA/CN=osajide.42.fr" -out request.csr
RUN openssl x509 -req -in request.csr -signkey prv.key -days 100 -out signature.crt

FROM debian:bullseye
RUN apt update && apt install nginx -y
COPY --from=first /certificate /certificate
COPY conf/nginx.conf /etc/nginx/sites-available/mandatory
COPY conf/adminer.conf /etc/nginx/sites-available/adminer
RUN ln -s /etc/nginx/sites-available/mandatory /etc/nginx/sites-enabled/mandatory;\
	ln -s /etc/nginx/sites-available/adminer /etc/nginx/sites-enabled/adminer
CMD [ "nginx", "-g", "daemon off;" ]