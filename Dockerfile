FROM php:7.2

MAINTAINER Ihor Vakulenko <VakulenkoIhor@gmail.com>

RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev
RUN apt-get install -my wget gnupg

RUN apt-get install -y git
RUN git config --global core.fileMode false

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install -j$(nproc) pdo_mysql \
        gd \
        bcmath \
        zip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer
RUN curl -sSL https://deb.nodesource.com/setup_6.x | bash --
RUN apt-get install -y nodejs

# Clean up cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*