#!/bin/sh
#script for crontab
cd /usr/local/www/dokuwiki
git add -A *
git commit -m "Wiki backup `date +%F-%s`"
git push
