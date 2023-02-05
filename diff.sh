#!/bin/bash
# This is a include file located in $HESTIA/func
# This can be modified to use borgbackup or rdiff
# Location for duplicity local, sftp, azure, onedrive, read all 
# in https://duplicity.us/
location=local
# Days mantain Full backup ( 7 by default )
# You can run backup script each day, each hour etc
# But full backup will rotate each 7 days
diffDay=7
#GnuGP key needed to encrypt backup
GNUSer=mail@domain.ltd
diffDir=/home/backup/diff/
diffMail=${diffDir}/$user/mail
diffWeb=${diffDir}/$user/web
