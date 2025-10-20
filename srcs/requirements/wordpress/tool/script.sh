#!bin/bash

set -e

cd /var/www/html
if [ ! -f "index.php" ]; then
	wp core download --allow-root
	wp config create \
		--dbname=$DB_NAME \
		--dbuser=$DB_ADMIN \
		--dbpass=$DB_ADMIN_PASS \
		--dbhost=mariadb \
		--allow-root

	wp core install \
		--url=$DOMAIN_NAME \
		--title="Inception" \
		--admin_user=$WP_ADMIN_NAME \
		--admin_password=$WP_ADMIN_PASS \
		--admin_email=$WP_ADMIN_MAIL \
		--allow-root

	wp user create \
		$WP_USER_NAME \
		$DB_USER_MAIL \
		--user_pass=$DB_USER_PASS \
		--allow-root
else
	echo "Wordpress already installed !"
fi

echo "Worpress configurated successfully !!!"

exec "$@"