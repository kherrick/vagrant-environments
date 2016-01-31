#!/usr/bin/env bash

sed -i 's#post_max_size = 8M#post_max_size = 256M#g' /etc/php/7.0/apache2/php.ini

if [ $? -ne 0 ]; then
  echo "Setting the php.ini configuration option 'post_max_size' failed."
  exit 1
fi

sed -i 's#upload_max_filesize = 2M#upload_max_filesize = 256M#g' /etc/php/7.0/apache2/php.ini

if [ $? -ne 0 ]; then
  echo "Setting the php.ini configuration option 'upload_max_filesize' failed."
  exit 1
fi

service apache2 restart

if [ $? -ne 0 ]; then
  echo Restarting apache failed.
  exit 1
fi

touch /opt/vagrant-provision/.post-php-install
