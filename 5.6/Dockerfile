FROM php:5.6-apache
LABEL maintainer="TimRod"

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_USER_ID 33
ENV WWW_PATH /var/www/html
ENV RSYNC_DAEMON 'false'
ENV RSYNC_DELAY 5
ENV RSYNC_DST_DIR /var/www/html/
ENV RSYNC_DIR /rsync/
ENV RSYNC_DELETE 'false'
ENV RSYNC_MODE 'in'
ENV UNISON_DAEMON 'false'
ENV UNISON_DELAY 5
ENV UNISON_DST_DIR /var/www/html/
ENV UNISON_DIR /unison/

RUN a2enmod rewrite

RUN set -xe \
    && apt-get update \
    && apt-get install -y libpng-dev libjpeg-dev libmcrypt-dev zip unzip nano rsync unison \
    && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
    && docker-php-ext-install mcrypt gd mysqli zip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fSL 'http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz' -o ioncube.tar.gz \
    && mkdir -p ioncube \
    && tar -xf ioncube.tar.gz -C ioncube --strip-components=1 \
    && rm ioncube.tar.gz \
    && mv ioncube/ioncube_loader_lin_5.6.so /usr/local/lib/php/extensions/ioncube_loader_lin_5.6.so \
    && rm -r ioncube

COPY php.ini /usr/local/etc/php/
COPY docker-init.sh /bin/
COPY rsync-daemon.sh /bin/
COPY unison-daemon.sh /bin/

RUN set -xe \
    && chmod +x /bin/docker-init.sh \
    && chmod +x /bin/rsync-daemon.sh \
    && chmod +x /bin/unison-daemon.sh \
    && mkdir ${RSYNC_DIR} \
    && mkdir ${UNISON_DIR}

EXPOSE 80

CMD ["docker-init.sh"]