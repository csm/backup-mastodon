#!/bin/bash

export RAILS_ENV=production
sudo --preserve-env=RAILS_ENV -u mastodon /home/mastodon/live/bin/tootctl media remove --days=14
sudo --preserve-env=RAILS_ENV -u mastodon /home/mastodon/live/bin/tootctl preview_cards remove --days=14