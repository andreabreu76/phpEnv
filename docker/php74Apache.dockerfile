FROM php:7.4-apache-buster

LABEL company="" \
    maintainer="Andre Abreu" \
    maintainer.email="andre.abreu@gmail.com" \ 
    description="Interpretador(PHP7.4) e transporte(Apache 2.4)" \  
    version="1.1.0"

RUN apt update && apt -y upgrade 

RUN apt install -y --no-install-recommends vim curl apt-utils mcrypt libpq-dev libz-dev libfreetype6-dev zlib1g-dev libssl-dev libmcrypt-dev libxml2-dev libxslt-dev libzip-dev libbz2-dev libmcrypt-dev nodejs cron \ 
    && docker-php-ext-install pcntl \
    && docker-php-ext-configure gd \
    && docker-php-ext-install zip \
    && docker-php-ext-install bz2 \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install xsl 

RUN yes | pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && echo "xdebug.mode=debug" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.idekey=VSCODE" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.client_host=host.docker.internal" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_connect_back=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.log=/var/www/html/xdebug.log" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && touch /var/www/html/xdebug.log \
    && chown www-data:www-data /var/www/html/xdebug.log \
    && chmod 775 /var/www/html/xdebug.log

RUN ln -sf /proc/self/fd/1 /var/log/apache2/access.log && \
    ln -sf /proc/self/fd/1 /var/log/apache2/error.log

RUN a2enmod rewrite 

COPY config/000-default.conf /etc/apache2/sites-available/000-default.conf

RUN rm -rf /var/lib/apt/lists/*