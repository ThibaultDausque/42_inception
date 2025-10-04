FROM debian:bookworm

RUN apt -y update && apt -y upgrade
RUN apt -y install php7.3 php-fpm php-mysql
RUN apt -y install wget
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xvf wordpress-6.0-fr_FR.gz -P /var/www
RUN chown -R root:root /var/www/wordpress



