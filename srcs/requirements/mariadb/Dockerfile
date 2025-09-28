FROM debian:bookworm

RUN apt -y update
RUN apt -y upgrade
RUN apt install mariadb-server mariadb-client -y

COPY ./tools/mariadb.sh ./mariadb.sh
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld
RUN touch /etc/mysql/init.sql && chown -R mysql:mysql /etc/mysql/init.sql

RUN chmod +x mariadb.sh

EXPOSE 3306
ENTRYPOINT ["./mariadb.sh"]
CMD ["mysqld"]