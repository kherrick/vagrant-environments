#!/usr/bin/env bash
### move to /usr/local/src
cd /usr/local/src

wget -N http://www.erlang.org/download/otp_src_17.1.tar.gz
if [ $? -ne 0 ]; then
 echo Could not download erlang...
 exit 1
fi

tar -xzpvf otp_src_17.1.tar.gz
if [ $? -ne 0 ]; then
 echo Could not extract erlang...
 exit 1
fi

cd otp_src_17.1

./configure > /dev/null
if [ $? -ne 0 ]; then
 echo Could not configure erlang source...
 exit 1
fi

su - root -c 'cd /usr/local/src/otp_src_17.1; make'
if [ $? -ne 0 ]; then
  echo Could not make erlang source...
  exit 1
fi

make install
if [ $? -eq 0 ]; then
  ### touch the file so vagrant knows everything went well
  touch /opt/vagrant-provision/.erlang
else
  echo Could not install erlang...
  exit 1
fi
