#!/bin/bash

chown $APACHE_RUN_USER:$APACHE_RUN_USER_ID $UNISON_DIR
chmod 0777 $UNISON_DIR

while true; do
  unison "-auto" "-batch" "-owner" "-times" $UNISON_DIR $UNISON_DST_DIR
  sleep $UNISON_DELAY
done
