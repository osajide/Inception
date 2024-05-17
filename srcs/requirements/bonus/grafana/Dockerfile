FROM debian:bullseye
RUN apt update && apt install wget -y
RUN apt-get install -y adduser libfontconfig1 musl &&\
	wget https://dl.grafana.com/enterprise/release/grafana-enterprise_11.0.0_amd64.deb&&\
	dpkg -i grafana-enterprise_11.0.0_amd64.deb
CMD [ "grafana-server", "-homepath", "/usr/share/grafana/" ]