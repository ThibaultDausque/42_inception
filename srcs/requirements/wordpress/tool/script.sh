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
		--admin_user=$ADMIN_NAME \
		--admin_password=$ADMIN_PASS \
		--admin_email=$ADMIN_MAIL \
		--allow-root

	wp user create \
		$WP_USER_NAME \
		$WP_USER_MAIL \
		--user_pass=$WP_USER_PASS \
		--allow-root
else
	echo "Wordpress already installed !"
fi

echo "Worpress configurated successfully !!!"

exec "$@"