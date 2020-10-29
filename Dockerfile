FROM php:7.4.11-cli-buster

RUN apt-get update && apt-get install -y zip unzip git zlib1g-dev libicu-dev libfreetype6-dev libjpeg62-turbo-dev libpng-dev g++ --no-install-recommends \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean

RUN docker-php-ext-configure intl
RUN docker-php-ext-install pdo pdo_mysql intl gd exif

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer.phar

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
