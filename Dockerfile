
FROM alpine:3.5
LABEL \
    description="Alpine Linux + nginx + php7 + mariadb" \
    version="0.9" \
    maintainer="xy22y@xy22y.org"
        

RUN apk --update add \
  git \
  mariadb \
  mariadb-client \
  nginx \
  php7-fpm \
  php7-pdo \
  php7-json \
  php7-openssl \
  php7-mysqli \
  php7-mcrypt \
  php7-sqlite3 \
  php7-pdo_sqlite \
  php7-ctype \
  php7-zlib \
  php7-curl \
  php7-phar \
  php7-xml \
  php7-opcache \
  php7-intl \
  php7-bcmath \
  php7-dom \
  php7-xmlreader \
  supervisor \
  && rm -rf /var/cache/apk/*

RUN mkdir -p /var/run/supervisord
ADD supervisord.conf /etc/supervisord.conf

RUN mkdir -p /var/run/nginx
ADD nginx.conf /etc/nginx/nginx.conf

ADD php.conf /etc/php7/php.ini
ADD php_fpm.conf /etc/php7/php-fpm.d/www.conf

RUN mkdir -p /var/run/mysql
RUN chown mysql:mysql /var/run/mysql
ADD mariadb_run.sh /usr/local/bin/mariadb_run.sh
RUN chmod 755 /usr/local/bin/mariadb_run.sh
ADD mariadb_init.sh /usr/local/bin/mariadb_init.sh
RUN chmod 755 /usr/local/bin/mariadb_init.sh
ADD mariadb.conf /etc/mysql/my.cnf

VOLUME ["/var/www", "/var/lib/mysql"]

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

EXPOSE 80 3306 9000


