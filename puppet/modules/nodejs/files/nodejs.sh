#!/usr/bin/env bash

cd /opt || exit

FILENAME=$(wget --quiet -O - http://nodejs.org/dist/latest/ | grep -i linux-x86.tar.gz | cut -d\" -f2)

if [ "$FILENAME" ]; then
  DIRECTORY=/opt/$(basename "$FILENAME" .tar.gz)
  URL=http://nodejs.org/dist/latest/"$FILENAME"
else
  echo Could not find the appropriate Node.js download...
  exit 1
fi

wget "$URL"

if [ $? -eq 0 ]; then
  tar -xzpvf "$FILENAME"
  rm "$FILENAME"

  ln -s "$DIRECTORY/bin/node" /usr/local/bin/node
  ln -s "$DIRECTORY/bin/npm" /usr/local/bin/npm

  touch /opt/vagrant-provision/.nodejs
else
  echo Could not fetch Node.js...
  exit 1
fi
