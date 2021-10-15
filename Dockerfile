FROM php:7.4-fpm

ADD files/ /

RUN pecl install xdebug \
    && docker-php-ext-enable xdebug