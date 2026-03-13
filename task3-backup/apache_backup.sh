#!/bin/bash

set -o pipefail

DATE=$(date +%F)

BACKUP_FILE="/backups/apache_backup_$DATE.tar.gz"

LOGFILE="/backups/apache_backup.log"

tar -czvf $BACKUP_FILE /etc/httpd /var/www/html >> $LOGFILE 2>&1

echo "Backup created on $DATE : $BACKUP_FILE" >> $LOGFILE

echo "Verifying backup..." >> $LOGFILE
tar -tzf $BACKUP_FILE >> $LOGFILE
