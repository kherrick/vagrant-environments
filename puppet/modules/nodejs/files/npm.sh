#!/usr/bin/env bash

sudo npm config set strict-ssl false

if [ $? -ne 0 ]; then
  echo Setting the npm strict-ssl config option to false for the root user failed.
  exit 1
fi

su - vagrant -c 'npm config set strict-ssl false'

if [ $? -ne 0 ]; then
  echo   echo Setting the npm strict-ssl config option to false for the vagrant user failed.
  exit 1
fi

touch /opt/vagrant-provision/.npm
