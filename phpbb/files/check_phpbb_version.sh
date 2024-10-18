#!/bin/bash
# check if phpbb needs an update

### variables ###
service="phpBB_version"
status=0

### main ###

active_version=$(grep phpbb_version /var/www/wegforum/styles/prosilver/style.cfg | cut -d " " -f 3) 

content=$(wget https://www.phpbb.com/ -q -O -)

update_version=$(echo "$content" | grep Download | grep version | grep -Eo '[0-9]\.[0-9]\.[0-9][0-9]')

if [ "$active_version" == "$update_version" ]
then
   statustext="current version: $active_version, no update available"
else
   status=1
   statustext="current version: $active_version, update available: $update_version"
fi 

echo "$status $service - $statustext"
