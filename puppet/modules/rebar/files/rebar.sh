#!/usr/bin/env bash

### move to /usr/local/src
cd /usr/local/src

git clone git://github.com/rebar/rebar.git
if [ $? -ne 0 ]; then
  echo Could not clone rebar from the git repository...
  exit 1
fi

cd rebar
sudo ./bootstrap
if [ $? -ne 0 ]; then
  echo Could not complete bootstrap...
  exit 1
fi

ln -s /usr/local/src/rebar/rebar /usr/local/bin/rebar
if [ $? -eq 0 ]; then
  ### touch the file so vagrant knows everything went well
  touch /opt/vagrant-provision/.rebar
else
  echo Could not symlink rebar...
  exit 1
fi
