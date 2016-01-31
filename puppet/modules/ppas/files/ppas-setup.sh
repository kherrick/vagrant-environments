#!/usr/bin/env bash

yes | add-apt-repository ppa:ondrej/php

if [ $? -ne 0 ]; then
  echo Adding the ppa ondrej/php failed.
  exit 1
fi

touch /opt/vagrant-provision/.ppas-setup
