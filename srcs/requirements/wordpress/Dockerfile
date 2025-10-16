FROM debian:bookworm

RUN apt -y update && apt -y upgrade
RUN apt -y install php php-fpm php-mysql mariadb-client wget
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
RUN		chown -R www-data:www-data root /var/www/wordpress
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./tool/script.sh .
RUN chmod +x script.sh

EXPOSE 9000

ENTRYPOINT ["./script.sh"]
CMD ["php-fpm", "-F"]



