#! /bin/bash

BACKUPDIR=/backup/mysql
USERNAME=mybackup
DATE=`date '+%Y%m%d_%H:%M:%S'`

if [ ! -d $BACKUPDIR ]
then
    mkdir $BACKUPDIR
fi
cd $BACKUPDIR

rm $BACKUPDIR/*

DATABASES=`mysql -u$USERNAME -Bse 'show databases'`
for DATABASE in $DATABASES; do
    if [ "${DATABASE}" == "information_schema" ] || [ "${DATABASE}" == "performance_schema" ] || [ "${DATABASE}" == "sys" ]; then
        echo "no backup of $DATABASE"
    else
        echo "Backup of $DATABASE"
        if [ $DATABASE == "nextcloud" ]
        then
            sudo -u www-data php /var/www/nextcloud/occ maintenance:mode --on
            mysqldump --single-transaction -u$USERNAME $DATABASE > ${DATABASE}_$DATE.sql
            sudo -u www-data php /var/www/nextcloud/occ maintenance:mode --off
        else
            mysqldump -u$USERNAME $DATABASE > ${DATABASE}_$DATE.sql
        fi
    fi
done