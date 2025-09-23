FROM debian:bookworm

RUN apt -y update
RUN apt install mariadb-server mariadb-client -y

COPY ./tools/mariadb.sh ./mariadb.sh
COPY ./conf/50-server.cnf ./etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod +x mariadb.sh


EXPOSE 3306
ENTRYPOINT ["./mariadb.sh"]
CMD ["mysqld"]