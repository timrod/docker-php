#!/bin/bash

groupadd -g $APACHE_RUN_USER_ID $APACHE_RUN_USER
useradd -g $APACHE_RUN_USER -u $APACHE_RUN_USER_ID $APACHE_RUN_USER

set -e

# chown -R ${APACHE_RUN_USER}:${APACHE_RUN_USER_ID} ${WWW_PATH}

if [[ $RSYNC_DAEMON == 'true' ]]; then
  nohup rsync-daemon.sh &
fi

if [[ $UNISON_DAEMON == 'true' ]]; then
  nohup unison-daemon.sh &
fi

apache2-foreground