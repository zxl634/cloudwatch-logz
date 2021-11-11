#!/usr/bin/env bash
curl https://raw.githubusercontent.com/logzio/logzio-aws-metrics/main/docker-compose.yml -o docker-compose.yml

# Set env vars
set -a
. .env
set +a

docker-compose up
