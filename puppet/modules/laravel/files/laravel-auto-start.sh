cat <<EOF > /etc/rc.local
#!/bin/sh -e
#
# rc.local
#
# This script is executed at the end of each multiuser runlevel.
# Make sure that the script will "exit 0" on success or any other
# value on error.
#
# In order to enable or disable this script just change the execution
# bits.
#
# By default this script does nothing.

while true; do
    if [ -d /vagrant/laravel ]; then
        cd /vagrant/laravel
        php artisan serve --host 0.0.0.0 &
        break;
    fi
done

exit 0
EOF

cd /vagrant/laravel
php artisan serve --host 0.0.0.0 &
