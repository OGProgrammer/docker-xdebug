#!/usr/bin/env bash

#Self signed SSL cert for nginx https
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/ssl-cert-snakeoil.key -out /etc/ssl/certs/ssl-cert-snakeoil.pem -subj '/CN=*.example.local/O=OGP/C=US'

# Override xdebug config with the IP address of the host machine
sed -i -e "s/10.254.254.254/${OGP_XDEBUG_HOST:=10.254.254.254}/g" /usr/local/etc/php/conf.d/xdebug.ini

# supervisord start
exec supervisord -n -c /etc/supervisor/supervisord.conf