#!/bin/bash

groupadd -g $APACHE_RUN_USER_ID $APACHE_RUN_USER
useradd -g $APACHE_RUN_USER -u $APACHE_RUN_USER_ID $APACHE_RUN_USER

set -e

if [[ $RSYNC_DAEMON == 'true' ]]; then
  nohup rsync-daemon.sh &
fi

apache2-foreground