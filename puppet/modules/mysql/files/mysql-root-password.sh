#!/usr/bin/env bash
MYSQL_ROOT_PASSWORD=vagrant

debconf-set-selections <<< "mysql-server mysql-server/root_password password $MYSQL_ROOT_PASSWORD"

if [ $? -ne 0 ]; then
  echo 'Setting the mysql-server root password failed.'
  exit 1
fi

debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $MYSQL_ROOT_PASSWORD"

if [ $? -ne 0 ]; then
  echo 'Verifying the mysql-server root password failed.'
  exit 1
fi

touch /opt/vagrant-provision/.mysql-root-password
