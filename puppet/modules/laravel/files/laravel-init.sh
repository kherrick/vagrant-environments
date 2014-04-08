#!/usr/bin/env bash

if [ ! -d /vagrant/laravel ]; then
    su - vagrant -c '/vagrant/bin/composer create-project laravel/laravel laravel --prefer-dist -d /vagrant'
    if [ $? -ne 0 ]; then
      echo Creating the laravel project failed.
      exit 1
    else
      touch /opt/vagrant-bootstrap/.laravel-init
    fi
else
  touch /opt/vagrant-bootstrap/.laravel-init
fi