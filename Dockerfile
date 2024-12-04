FROM skpr/php-fpm:8.3-v2-latest

COPY --from=docker.io/composer:2 --chown=skpr:skpr /usr/bin/composer /usr/local/bin/

# Copy the Drupal application code in.
COPY --from=docker.io/drupal:10.3 --chown=skpr:skpr /opt/drupal /data

# Make this Drupal application compatible with our images.
RUN ln -sf /data/web /data/app

# Override settings.php
ADD --chown=skpr:skpr settings.php /data/app/sites/default/settings.php
ADD --chown=skpr:skpr services.yml /data/app/sites/default/services.yml

# Add drush
RUN composer require drush/drush
COPY drush /etc/drush
