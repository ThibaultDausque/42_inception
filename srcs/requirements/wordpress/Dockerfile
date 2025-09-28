FROM debian:bookworm

RUN apt -y update && apt -y upgrade
RUN apt -y install php-fpm php-mysql
RUN cd /tmp && curl -LO https://wordpress.org/latest.tar.gz && tar -xzf latest.tar.gz
RUN mv wordpress /var/www/html

RUN chown -R www-data:www-data /var/www/html/wordpress
RUN chmod -R 755 /var/www/html/wordpress
