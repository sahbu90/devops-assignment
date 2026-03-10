#!/bin/bash

DATE=$(date +%F)
BACKUP_FILE="/backups/apache_backup_$DATE.tar.gz"
LOG_FILE="/backups/apache_backup_log.txt"

tar -czvf $BACKUP_FILE /etc/apache2 /var/www/html

echo "Backup created: $BACKUP_FILE" >> $LOG_FILE

echo "Verifying backup contents:" >> $LOG_FILE
tar -tzf $BACKUP_FILE >> $LOG_FILE

echo "---------------------------------" >> $LOG_FILE
