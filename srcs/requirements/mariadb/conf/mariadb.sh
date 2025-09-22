#/bin/sh
set -e

echo "Initialisation of MariaDB... 🚀"
mysqld_safe --skip-networking & pid="$!"

un