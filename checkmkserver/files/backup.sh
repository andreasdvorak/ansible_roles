#! /bin/bash

BACKUPDIR=/backup/checkmk
DATE=`date '+%Y%m%d_%H_%M_%S'`

cd $BACKUPDIR
cp -r /usr/lib/check_mk_agent/local/* . 