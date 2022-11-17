# backup-mastodon

A helper script and systemd files for backing up my own instance of
mastodon to DreamObjects. Can be used with any S3-compatible storage, probably.

This is meant to be used on Ubuntu.

How to use:

0. Install `awscli` and `toot` on your system, if needed.
1. Run `useradd --disabled-login mastodon-backup`.
1. Run `sudo -u mastodon-backup toot login`. Log in to your instance with a bot account.
1. Add the following to the file `/etc/backup-mastodon.env`:
    * `export AWS_ACCESS_KEY_ID=xxx` (your access key ID)
    * `export AWS_SECRET_ACCESS_KEY=xxx` (your secret access key)
    * `export BUCKET=xxx` (your bucket name)
    * Optional, `export ENDPOINT_OVERRIDE=--endpoint https://xxx`. If you are using DreamObjects, set this to `https://objects-us-east-1.dream.io`.
2. Copy `backup-mastodon.sh` to `/usr/local/bin`.
3. Copy `backup-mastodon.service` and `backup-mastodon.timer` to `/etc/systemd/system`.
4. Run `sudo systemctl enable backup-mastodon.service backup-mastodon.timer`.
5. Run `sudo systemctl start backup-mastodon.timer`.

As is, this will back up your mastodon database and config to an S3 or S3-compatible storage once nightly.