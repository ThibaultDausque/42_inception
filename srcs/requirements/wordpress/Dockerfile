FROM debian:bookworm

RUN apt -y update && apt -y upgrade
RUN apt -y install php-fpm php-mysql
RUN cd /var/www/html && curl -LO https://wordpress.org/latest.tar.gz && tar -xzf latest.tar.gz

RUN chown -R www-data:www-data /var/www/html/wordpress
RUN chmod -R 755 /var/www/html/wordpress


