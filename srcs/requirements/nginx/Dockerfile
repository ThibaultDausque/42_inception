FROM debian:bookworm

RUN apt -y update
RUN apt -y install nginx openssl
RUN apt -y install ufw

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/certificate.crt -keyout /etc/nginx/ssl/certificate.key -subj "/C=FR/ST=NA/L=Angouleme/O=42/OU=42/CN=$DOMAIN_NAME/UID=tdausque"

RUN mkdir -p /var/run/
COPY ./conf/server.conf /etc/nginx/conf.d

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]