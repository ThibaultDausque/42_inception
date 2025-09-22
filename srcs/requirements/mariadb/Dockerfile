FROM debian:bookworm

RUN apt -y update
RUN apt install mariadb-server mariadb-client-y

COPY ./conf/mariadb.sh ./mariadb.sh

RUN chmod +x mariadb.sh


EXPOSE 3306
ENTRYPOINT ["./mariadb.sh"]
CMD ["mysqld"]