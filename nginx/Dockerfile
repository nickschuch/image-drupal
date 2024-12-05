FROM skpr/php-fpm:8.3-v2-latest

ARG DRUPAL_VERSION="10.3"

COPY --from=docker.io/drupal:${DRUPAL_VERSION} --chown=skpr:skpr /opt/drupal /data
RUN ln -sf /data/web /data/app