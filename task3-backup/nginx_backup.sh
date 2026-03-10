#!/bin/bash

DATE=$(date +%F)
BACKUP_FILE="/backups/nginx/nginx_backup_$DATE.tar.gz"
LOG_FILE="/backups/nginx/nginx_backup_log.txt"

tar -czvf $BACKUP_FILE /etc/nginx /usr/share/nginx/html

echo "Backup created: $BACKUP_FILE" >> $LOG_FILE

echo "Verifying backup contents:" >> $LOG_FILE
tar -tzf $BACKUP_FILE >> $LOG_FILE

echo "---------------------------------" >> $LOG_FILE
