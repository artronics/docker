#!/bin/bash

SETUP_DIR="/app/setup"

GITLAB_VERSION=${GITLAB_VERSION:-7.11.4}  # should normally comes from Dockerfile
GITLAB_SHELL_VERSION=2.6.3

SIDEKIQ_CONCURRENCY=${SIDEKIQ_CONCURRENCY:-5}
SIDEKIQ_SHUTDOWN_TIMEOUT=${SIDEKIQ_SHUTDOWN_TIMEOUT:-10}

GITLAB_PORT=${GITLAB_PORT:-80}
GITLAB_HOME="/home/git"
GITLAB_INSTALL_DIR="${GITLAB_HOME}/gitlab"
GITLAB_DATA_DIR="${GITLAB_HOME}/data"
GITLAB_LOG_DIR="/var/log/gitlab"
GITLAB_SHELL_INSTALL_DIR="${GITLAB_HOME}/gitlab-shell"
GITLAB_BACKUP_DIR="${GITLAB_BACKUP_DIR:-$GITLAB_DATA_DIR/backups}"

GITLAB_TIMEZONE=${GITLAB_TIMEZONE:-Europe/Zurich}
GITLAB_EMAIL_DISPLAY_NAME=${GITLAB_EMAIL_DISPLAY_NAME:-GitLab}


DB_PORT=5432
DB_HOST=${POSTGRES_PORT_5432_TCP_ADDR}
DB_PASS=${POSTGRES_ENV_POSTGRES_PASSWORD}
DB_USER=${POSTGRES_ENV_POSTGRES_USER}
DB_NAME=${POSTGRES_ENV_POSTGRES_USER}
DB_POOL=${DB_POOL:-10}
GITLAB_ROOT_PASSWORD=${GITLAB_ROOT_PASSWORD:-MPMNuE8T}

REDIS_HOST=${REDIS_PORT_6379_TCP_ADDR}
REDIS_PORT=6379

if [ -z ${UNICORN_WORKERS} ]; then
    UNICORN_WORKERS=$(expr $(nproc) + 1)
fi
UNICORN_TIMEOUT=${UNICORN_TIMEOUT:-60}
