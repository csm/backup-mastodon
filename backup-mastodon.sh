#!/bin/bash

source /etc/backup-mastodon.env

set -ex

rm -f /tmp/mastodon_production.psql*

sudo -u postgres pg_dump -f /tmp/mastodon_production.psql mastodon_production
gzip /tmp/mastodon_production.psql

aws $ENDPOINT_OVERRIDE s3 cp /tmp/mastodon_production.psql.gz s3://${BUCKET}/mastodon_production.psql.gz
aws $ENDPOINT_OVERRIDE s3 cp /home/mastodon/live/.env.production s3://${BUCKET}/env.production

sudo -u mastodon-backup toot post "Mastodon backed up at $(date)."