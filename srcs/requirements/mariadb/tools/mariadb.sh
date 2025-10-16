#!/bin/sh
set -e

mysqld --user=root --socket=/run/mysqld/mysqld.socket &

echo "⏳ Waiting for MariaDB to create the socket..."
until [ -S /run/mysqld/mysqld.sock ]; do
	sleep 1
done
echo "✅ Socket found, MariaDB is ready!"

cat >/etc/mysql/init.sql <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY ${DB_ADMIN_PASS};
CREATE DATABASE IF NO EXISTS ${DB_NAME};
CREATE USER IF NO EXISTS '${DB_ADMIN}'@'%' IDENTIFIED BY '${DB_ADMIN_PASS}';
CREATE USER IF NO EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_USER_PASS}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_ADMIN}' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

echo "Database created ✅✅✅"

