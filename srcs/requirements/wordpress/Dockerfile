FROM debian:bookworm

RUN apt -y update && apt -y upgrade
RUN apt -y install php php-fpm php-mysql mariadb-client wget
RUN chown -R www-data:www-data root /var/www/html
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp && chmod +x /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/

COPY ./tool/script.sh .
RUN chmod +x script.sh

EXPOSE 9000

ENTRYPOINT ["./script.sh"]
CMD ["php-fpm8.2", "-F"]
