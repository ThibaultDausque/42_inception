#!bin/bash

set -e

cd /var/www/html
if [ ! -f "index.php" ]; then
	wp core download --allow-root
	wp config create \
		--dbname=$DB_NAME \
		--dbuser=$DB_USER \
		--dbpass=$DB_PASS \
		--dbhost=mariadb \
		--allow-root

	wp core install \
		--url=$DOMAIN_NAME \
		--title="Inception" \
		--admin_user=$WP_USER_NAME \
		--admin_password=$WP_USER_PASS \
		--admin_email=$WP_USER_MAIL \
		--allow-root

	wp user create \
		$WP_USER2_NAME \
		$WP_USER2_MAIL \
		--user_pass=$WP_USER2_PASS \
		--allow-root
else
	echo "Wordpress already installed !"
fi

echo "Worpress configurated successfully !!!"

exec "$@"