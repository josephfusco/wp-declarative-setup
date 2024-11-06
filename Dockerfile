# Dockerfile
FROM wordpress:6.0-php8.0-apache

# Install jq for JSON parsing
RUN apt-get update && apt-get install -y jq

# Copy configuration file and script
COPY wordpress.config.json /var/www/html/wordpress.config.json
COPY bin/apply_blueprint.sh /usr/local/bin/apply_blueprint.sh

# Entrypoint to run the configuration application script
ENTRYPOINT ["/usr/local/bin/apply_blueprint.sh"]