FROM php:8.0-apache

#Setting user up
RUN groupadd -g 1000 1000 && useradd -u 1000 -g 1000 -s /bin/sh 1000

#PHP Packages
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y curl
RUN apt-get install -y zip
RUN apt-get install -y unzip
RUN apt-get install -y git
RUN apt-get install -y libxml2-dev
RUN apt-get install -y nano
RUN apt-get install -y libcurl4
RUN apt-get install -y libzip-dev
RUN apt-get install -y libonig-dev
RUN apt-get install -y libpng-dev

#Docker Apache modules
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install xml
RUN docker-php-ext-install zip
RUN docker-php-ext-install mbstring
RUN docker-php-ext-install session
# RUN docker-php-ext-install json # não é mais necessário em php8
RUN docker-php-ext-install exif
RUN docker-php-ext-install gd
RUN docker-php-ext-install fileinfo
RUN docker-php-ext-install gettext
RUN docker-php-ext-install iconv

RUN docker-php-ext-enable mysqli pdo_mysql xml zip mbstring session exif gd fileinfo gettext iconv
RUN a2enmod rewrite

#Composer
#RUN php -r "copy('http://getcomposer.org/installer', 'composer-setup.php');"
#RUN php composer-setup.php
#RUN php -r "unlink('composer-setup.php');"
#RUN mv composer.phar /usr/local/bin/composer

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"


#rodar comando composer install na pasta abaixo.
#RUN composer install --working-dir=/var/www/html/wp-content/themes/engie_corporate/app

USER 1000

CMD ["apachectl", "-D", "FOREGROUND"]