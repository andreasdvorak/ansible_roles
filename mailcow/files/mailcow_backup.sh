#! /bin/bash

BACKUPDIR=/backup/mailcow

cd $BACKUPDIR

rm -r $BACKUPDIR/*

MAILCOW_BACKUP_LOCATION=/backup/mailcow /opt/mailcow-dockerized/helper-scripts/backup_and_restore.sh backup all