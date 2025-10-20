FROM debian:bookworm

RUN apt -y update
RUN apt -y upgrade
RUN apt install mariadb-server mariadb-client gettext-base -y

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN mkdir ./entrypoint-initdb.d
COPY ./tools/init.sql.template /entrypoint-initdb.d
RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

COPY ./tools/mariadb.sh .
RUN chmod +x mariadb.sh

EXPOSE 3306

ENTRYPOINT ["./mariadb.sh"]
CMD ["mysqld"]
