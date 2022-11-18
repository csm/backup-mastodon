#!/bin/bash

source ~/.rbenv-init
export RAILS_ENV=production
/home/mastodon/live/bin/tootctl media remove --days=14
/home/mastodon/live/bin/tootctl preview_cards remove --days=14