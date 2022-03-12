FROM php:7.4-fpm
RUN docker-php-ext-install mysqli pdo pdo_mysql 
RUN apt-get update && apt-get install -y zlib1g-dev libmemcached-dev


RUN pecl install memcached
RUN echo extension=memcached.so >> /usr/local/etc/php/conf.d/memcached.ini

RUN php -r "copy('https://getcomposer.org/composer.phar', 'composer.phar');" \
  && mv composer.phar /usr/local/bin/composer \
  && chmod +x /usr/local/bin/composer


COPY ./conf/www.conf /usr/local/etc/php-fpm.d/www.conf
COPY ./conf/php.ini /usr/local/etc/php/

