# From debian jessie w/ phpfpm 7.1 & nginx in 1 container for simplicity
FROM ogprogrammer/php71-fpm-nginx

# Install XDebug
RUN yes | pecl install xdebug

# Add/Override files in container
ADD files/ /

# Kill stuff that we don't need
RUN rm -rf /etc/nginx/sites-enabled/default /var/www/html

# Make sure its executable inside the container
RUN chmod 755 /exec-init.sh

# Set the working directory for when you first jump into the container
WORKDIR /var/www

# This is the inital script that runs when the container is first fired up
CMD ["/exec-init.sh"]
