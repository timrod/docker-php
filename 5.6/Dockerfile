FROM php:5.6-apache
LABEL maintainer="TimRod"

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_USER_ID 33
ENV RSYNC_DAEMON 'false'
ENV RSYNC_DELAY 5
ENV RSYNC_DST_DIR /var/www/html/
ENV RSYNC_DIR /rsync/
ENV RSYNC_DELETE 'false'
ENV RSYNC_MODE 'in'

RUN a2enmod rewrite

RUN set -xe \
    && apt-get update \
    && apt-get install -y libpng-dev libjpeg-dev libmcrypt-dev zip unzip nano rsync \
    && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
    && docker-php-ext-install mcrypt gd mysqli zip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY docker-init.sh /bin/
COPY rsync-daemon.sh /bin/

RUN set -xe \
    && chmod +x /bin/docker-init.sh \
    && chmod +x /bin/rsync-daemon.sh \
    && mkdir ${RSYNC_DIR}

EXPOSE 80

CMD ["docker-init.sh"]