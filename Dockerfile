FROM php:8.2-fpm-alpine

RUN apk add --no-cache \
    bash \
    curl \
    git \
    unzip \
    libpng-dev \
    libjpeg-turbo-dev \
    freetype-dev \
    oniguruma-dev \
    libzip-dev \
    icu-dev \
    tzdata \
    shadow \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo pdo_mysql mbstring zip gd intl

RUN addgroup -g 1000 www && adduser -u 1000 -G www -s /bin/sh -D www

WORKDIR /var/www/app
COPY --chown=www:www ./app /var/www/app
COPY ./docker/entrypoint.sh /docker/entrypoint.sh

RUN chmod +x /docker/entrypoint.sh

ENTRYPOINT ["/docker/entrypoint.sh"]

USER www
