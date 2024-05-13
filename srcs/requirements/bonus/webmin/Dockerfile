FROM debian:bullseye
RUN apt update; apt install curl
RUN	curl -o setup-repos.sh https://raw.githubusercontent.com/webmin/webmin/master/setup-repos.sh ;\
	./setup-repos.sh
RUN command