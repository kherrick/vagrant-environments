#!/bin/bash
echo 'Rebooting the VM'

touch /root/.setup/firstboot/.reboot.sh

reboot
