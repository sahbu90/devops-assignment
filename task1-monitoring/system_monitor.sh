#!/bin/bash

DATE=$(date)
LOGFILE=/monitoring_logs/system_report.log

echo "System Report - $DATE" >> $LOGFILE

echo "CPU and Memory Usage" >> $LOGFILE
top -b -n1 | head -10 >> $LOGFILE

echo "Disk Usage" >> $LOGFILE
df -h >> $LOGFILE

echo "Directory Usage" >> $LOGFILE
du -sh /home/* 2>/dev/null >> $LOGFILE

echo "Top Processes" >> $LOGFILE
ps aux --sort=-%mem | head -5 >> $LOGFILE

echo "--------------------------------------" >> $LOGFILE
