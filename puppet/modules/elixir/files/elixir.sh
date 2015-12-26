#!/usr/bin/env bash
### move to /usr/local/src
cd /usr/local/src

wget https://github.com/elixir-lang/elixir/archive/v1.2.0-rc.1.tar.gz -O elixir-1.2.0-rc.1.tar.gz
if [ $? -ne 0 ]; then
 echo Could not download elixir...
 exit 1
fi

tar -xzpvf elixir-1.2.0-rc.1.tar.gz
if [ $? -ne 0 ]; then
 echo Could not extract elixir...
 exit 1
fi

su - root -c 'cd /usr/local/src/elixir-1.2.0-rc.1; make'
if [ $? -ne 0 ]; then
  echo Could not make elixir source...
  exit 1
fi

su - root -c 'cd /usr/local/src/elixir-1.2.0-rc.1; make install'
if [ $? -eq 0 ]; then
  ### touch the file so vagrant knows everything went well
  touch /opt/vagrant-provision/.elixir
else
  echo Could not install elixir...
  exit 1
fi
