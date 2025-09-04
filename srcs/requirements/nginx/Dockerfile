FROM debian:Bookworm

RUN apt -y update
RUN apt -y install nginx openssl
RUN apt -y install ufw
RUN systemctl status nginx

RUN mkdir -p /etc/nginx/ssl
COPY ./conf/nginx.conf /etc/nginx/ssl

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]