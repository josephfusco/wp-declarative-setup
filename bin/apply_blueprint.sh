#!/bin/bash

# Define the WordPress path
WP_PATH="/var/www/html"

# Check if the configuration file exists
if [[ -f "${WP_PATH}/wordpress.config.json" ]]; then
    # Read plugins from config file and install
    jq -r '.plugins[]?.slug' "${WP_PATH}/wordpress.config.json" | while read -r plugin; do
        wp plugin install "${plugin}" --activate --allow-root --path="${WP_PATH}"
    done

    # Read themes from config file and install
    jq -r '.themes[]?.slug' "${WP_PATH}/wordpress.config.json" | while read -r theme; do
        wp theme install "${theme}" --activate --allow-root --path="${WP_PATH}"
    done

    # Set constants from config file
    jq -r '.constants | to_entries[] | "\(.key) \(.value)"' "${WP_PATH}/wordpress.config.json" | while read -r key value; do
        wp config set "${key}" "${value}" --allow-root --path="${WP_PATH}"
    done

    # Set site options
    jq -r '.siteOptions | to_entries[] | "\(.key) \(.value)"' "${WP_PATH}/wordpress.config.json" | while read -r option value; do
        wp option update "${option}" "${value}" --allow-root --path="${WP_PATH}"
    done

    echo "Configuration applied successfully."
else
    echo "No wordpress.config.json file found. Skipping configuration application."
fi

# Start Apache in foreground
apache2-foreground
