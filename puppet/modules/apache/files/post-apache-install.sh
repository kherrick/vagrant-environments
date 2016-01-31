#!/usr/bin/env bash

sed -i 's#AllowOverride None#AllowOverride All#g' /etc/apache2/apache2.conf

if [ $? -ne 0 ]; then
  echo "Setting apache configuration option 'AllowOverride All' failed."
  exit 1
fi

a2enmod rewrite

if [ $? -ne 0 ]; then
  echo Enabling mod rewrite failed.
  exit 1
fi

sed -i 's#User ${APACHE_RUN_USER}#User vagrant#g' /etc/apache2/apache2.conf

if [ $? -ne 0 ]; then
  echo Updating the user that apache runs under failed.
  exit 1
fi

sed -i 's#Group ${APACHE_RUN_GROUP}#Group vagrant#g' /etc/apache2/apache2.conf

if [ $? -ne 0 ]; then
  echo Updating the group that apache runs under failed.
  exit 1
fi

service apache2 restart

if [ $? -ne 0 ]; then
  echo Restarting apache failed.
  exit 1
fi

touch /opt/vagrant-provision/.post-apache-install
