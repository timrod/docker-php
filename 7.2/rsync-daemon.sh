#!/bin/bash

chown $APACHE_RUN_USER:$APACHE_RUN_USER_ID $RSYNC_DIR
chmod 0777 $RSYNC_DIR

RSYNC_OPTIONS='-avu'

if [[ $RSYNC_DELETE == 'true' ]]; then
  RSYNC_OPTIONS+=' --delete'
fi

while true; do
  if [[ $RSYNC_MODE == 'out' ]]; then
    rsync $RSYNC_OPTIONS "--chown=${APACHE_RUN_USER}:${APACHE_RUN_USER_ID}" $RSYNC_DST_DIR $RSYNC_DIR
  else
    rsync $RSYNC_OPTIONS $RSYNC_DIR $RSYNC_DST_DIR
  fi
  sleep $RSYNC_DELAY
done
