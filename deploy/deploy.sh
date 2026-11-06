#!/bin/sh
# Runs on the NAS after a merge to main (post-merge hook), and from the weekly
# cron job so we pick up fresh base images.
set -e
cd "$(dirname "$0")"
git pull --ff-only
docker compose build --pull
docker compose up -d --force-recreate
docker image prune -f
