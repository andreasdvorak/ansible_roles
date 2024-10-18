#!/bin/bash

### variables ###
wwwdir=/var/www
installdir=/var/www/wegforum
tmpphpdir=/var/www/phpBB3

### main ###
version=$1

if [ "${version}" == "" ]
then
  echo "no version parameter"
  exit 0
fi

downloadurl="https://downloads.phpbb.de/pakete/deutsch/3.3/${version}"
downloadfile="phpBB-${version}-deutsch.zip"

cd $wwwdir
wget ${downloadurl}/${downloadfile}

unzip $downloadfile

rm ${tmpphpdir}/config.php
rm -r ${tmpphpdir}/images
rm -r ${tmpphpdir}/store
rm -r ${tmpphpdir}/files

rm -r ${installdir}/vendor
rm -r ${installdir}/cache

cp -r ${tmpphpdir}/* ${installdir}
chown -R www-data:www-data ${installdir}
 
rm -r ${tmpphpdir}
rm ${downloadfile}

echo "open https://wegforum.andvo.de/install/app.php"
echo "after the web update remove ${installdir}/install"