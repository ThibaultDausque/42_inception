#!/bin/sh
set -e

echo "Initialisation of MariaDB dawg... 🚀"

until mysql ping -h 127.0.0.1 -u root -p toto >/dev/null; do
	sleep 1
done

echo "✅ MariaDB is ready, creation of the database..."

