FROM php:5.6-fpm
RUN docker-php-ext-install mysql mysqli pdo pdo_mysql 
RUN apt-get update && apt-get install -y zlib1g-dev libmemcached-dev

RUN pecl install memcached-2.2.0

RUN echo extension=memcached.so >> /usr/local/etc/php/conf.d/memcached.ini

RUN php -r "copy('https://getcomposer.org/composer.phar', 'composer.phar');" \
  && mv composer.phar /usr/local/bin/composer \
  && chmod +x /usr/local/bin/composer

RUN  docker-php-ext-install mysqli
RUN docker-php-ext-install pdo pdo_mysql && docker-php-ext-enable pdo_mysql
RUN  docker-php-ext-install mysql && docker-php-ext-enable mysql




COPY ./conf/www.conf /usr/local/etc/php-fpm.d/www.conf
COPY ./conf/php.ini /usr/local/etc/php/