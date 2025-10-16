#!bin/bash

set -e

if [ ! -f "wp-config.php" ]; then
	wp config create \
		--dbname=$DB_NAME \
		--dbuser=$DB_ADMIN \
		--dbpass=$DB_ADMIN_PASS \
		--dbhost="$WORDPRESS_DB_HOST" \
		--allow-root

	wp core install \
		--url="https://tdausque.42.com" \
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
fi

echo "Worpress configurated successfully !!!"

exec "$@"
