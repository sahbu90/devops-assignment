#!/bin/bash

set -o pipefail

DATE=$(date +%F)

BACKUP_FILE="/backups/nginx_backup_$DATE.tar.gz"

LOGFILE="/backups/nginx_backup.log"

tar -czvf $BACKUP_FILE /etc/nginx /usr/share/nginx/html >> $LOGFILE 2>&1

echo "Backup created on $DATE : $BACKUP_FILE" >> $LOGFILE

echo "Verifying backup..." >> $LOGFILE

tar -tzf $BACKUP_FILE >> $LOGFILE
