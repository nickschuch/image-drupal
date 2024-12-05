FROM skpr/php-fpm:8.3-v2-latest

ARG DRUPAL_VERSION="10.3"

COPY --from=docker.io/drupal:10.3 --chown=skpr:skpr /opt/drupal /data
RUN ln -sf /data/web /data/app

ADD --chown=skpr:skpr settings.php /data/app/sites/default/settings.php
ADD --chown=skpr:skpr services.yml /data/app/sites/default/services.yml

COPY --from=docker.io/composer:2 --chown=skpr:skpr /usr/bin/composer /usr/local/bin/

RUN composer require drush/drush
COPY drush /etc/drush
