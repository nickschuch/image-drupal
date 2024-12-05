FROM skpr/php-fpm:8.3-v2-latest

COPY --from=docker.io/drupal:10.3 --chown=skpr:skpr /opt/drupal /data
RUN ln -sf /data/web /data/app