#!/usr/bin/env bash

WEBSITE='website'
DIRECTORY='/var/www/'$WEBSITE

#BACKUP
#mkdir -p '/var/www/backup/'$WEBSITE
#tar -zcvf 'backup.tar.gz' $DIRECTORY

#PREP
mkdir -p $DIRECTORY'/temp'
mv $DIRECTORY'/wp-content' $DIRECTORY'/temp/'
mv $DIRECTORY'/wp-config.php' $DIRECTORY'/temp/'
wget https://wordpress.org/latest.tar.gz -P $DIRECTORY

#CLEAN
tar -xzvf $DIRECTORY'/latest.tar.gz' -C $DIRECTORY
cp -rf $DIRECTORY'/wordpress/'* $DIRECTORY
rm -rf $DIRECTORY'/wordpress'
rm -rf $DIRECTORY'/wp-content'
mv $DIRECTORY'/temp/wp-content' $DIRECTORY
mv $DIRECTORY'/temp/wp-config.php' $DIRECTORY
rm -rf $DIRECTORY'/temp'

echo 'All Done!'