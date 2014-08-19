#!/bin/sh

set -e

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
CONF=/etc/mysql/my.cnf
CMD=mysqldump
ARG="$@ --single-transaction --master-data=1 --databases"

for DB in `grep ^binlog-do-db $CONF | awk '{print $3}'`; do
  ARG="$ARG $DB"
done

for IGNORE_TABLE in `grep ^replicate-ignore-table $CONF | awk '{print $3}'`; do
  ARG="$ARG --ignore-table=$IGNORE_TABLE"
done

$CMD $ARG
