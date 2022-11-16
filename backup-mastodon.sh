#!/bin/bash

source /etc/backup-mastodon.env

set -ex

rm -f /tmp/mastodon_production.psql*

sudo -u postgres pg_dump -f /tmp/mastodon_production.psql mastodon_production
gzip /tmp/mastodon_production.psql

aws --endpoint https://objects-us-east-1.dream.io s3 cp /tmp/mastodon_production.psql.gz s3://mastodon.miasma.me/mastodon_production.psql.gz
aws --endpoint https://objects-us-east-1.dream.io s3 cp /home/mastodon/live/.env.production s3://mastodon.miasma.me/env.production