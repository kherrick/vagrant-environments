#!/usr/bin/env bash

cd /var/www
rm index.html

if [ $? -ne 0 ]; then
  echo 'Removing the default index.html file failed.'
  exit 1
fi

curl http://wordpress.org/latest.tar.gz | tar xvz

if [ $? -ne 0 ]; then
  echo 'Downloading and decompressing WordPress failed.'
  exit 1
fi

mv wordpress/* ./

if [ $? -ne 0 ]; then
  echo 'Moving the WordPress files to the root of the site failed.'
  exit 1
fi

rmdir wordpress

if [ $? -ne 0 ]; then
  echo 'Removing the empty "wordpress" directory failed.'
  exit 1
fi

chown -R www-data:www-data /var/www

if [ $? -ne 0 ]; then
  echo 'Recursively changing the user and group of /var/www to www-data:www-data failed.'
  exit 1
fi

mysql --defaults-extra-file=/etc/mysql/debian.cnf < /opt/vagrant-provision/bin/wordpress.sql

if [ $? -ne 0 ]; then
  echo 'Creating the MySQL database "wordpress" failed.'
  exit 1
fi

touch /opt/vagrant-provision/.wordpress-intial-setup
