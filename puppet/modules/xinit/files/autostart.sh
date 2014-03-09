#!/bin/bash
echo 'Adding auto start options to /etc/rc.local'

#substitute all occurrences of "exit 0" with "startx\n&" on all lines that DO NOT contain "sure".
sed -i '/sure/!s/exit 0/startx\n&/' /etc/rc.local

touch /root/.setup/xinit/.autostart.sh
