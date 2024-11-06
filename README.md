# WP Declarative Setup

This project provides a production-ready WordPress environment using a declarative configuration file, `wordpress.config.json`. With this setup, you can specify plugins, themes, constants, and site options in one JSON file for consistent, repeatable environments across local, staging, and production.

## Advantages of `wordpress.config.json`

- **Single Source of Truth**: Consolidates WordPress settings, plugins, themes, and constants into a single file.
- **Declarative Configuration**: Enables a clear, predictable setup that applies the same settings across environments.
- **Simplified Maintenance**: Changes to site configuration only require updating `wordpress.config.json`, making the setup process consistent and easy to manage.

## Project Structure

```
.
├── .env                                # Environment variables for local use (gitignored)
├── .env.example                        # Template for environment variables
├── .phpcs.xml                          # PHP CodeSniffer configuration for WordPress Coding Standards
├── wordpress.config.json               # Main declarative config file for WordPress setup
├── Dockerfile                          # Docker configuration for WordPress
├── docker-compose.yml                  # Docker Compose for managing services
├── bin
│   └── apply_blueprint.sh              # Script to apply configuration from wordpress.config.json
├── composer.json                       # Composer dependencies and scripts
├── composer.lock                       # Composer lock file for dependency consistency
└── .github
    └── workflows
        └── ci.yml                      # GitHub Actions CI/CD workflow
```

## Quick Start

1. Copy `.env.example` to `.env` and fill in your environment variables:
   ```bash
   cp .env.example .env
   ```

2. Build and start the environment:
   ```bash
   composer start
   ```

3. Install dependencies and apply the configuration:
   ```bash
   composer setup
   ```

4. Access WordPress at [http://localhost:8000](http://localhost:8000).

## Common Commands

- **Start environment**: `composer start`
- **Stop environment**: `composer stop`
- **Install dependencies and apply configuration**: `composer setup`
- **Check code quality**: `composer lint`