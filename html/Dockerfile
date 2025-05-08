FROM php:8.2-fpm-alpine

RUN apk add --no-cache \
    bash \
    curl \
    unzip \
    tzdata \
    shadow \
    dos2unix \
    libpng-dev \
    libjpeg-turbo-dev \
    freetype-dev \
    oniguruma-dev \
    libzip-dev \
    icu-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo pdo_mysql mbstring zip gd intl

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

RUN addgroup -g 1000 www && adduser -u 1000 -G www -s /bin/sh -D www

COPY ./docker/entrypoint.sh /docker/entrypoint.sh

RUN dos2unix /docker/entrypoint.sh && \
    chmod +x /docker/entrypoint.sh

ENTRYPOINT ["/docker/entrypoint.sh"]

#USER root
