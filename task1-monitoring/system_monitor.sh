#!/usr/bin/env bash
set -euo pipefail

# Log location (same directory as script)
LOG_DIR="/monitoring_logs"
LOG_FILE="$LOG_DIR/system_report.log"
DATE=$(date)

# Check if log directory exists
if [ ! -d "$LOG_DIR" ]; then
    echo "Log directory not found. Creating $LOG_DIR..."
    mkdir -p "$LOG_DIR"
fi

# Check if log file exists
if [ ! -f "$LOG_FILE" ]; then
    echo "Log file not found. Creating $LOG_FILE..."
    touch "$LOG_FILE"
fi

echo "===== System Report $DATE =====" >> "$LOG_FILE"

echo "CPU and Memory Usage" >> "$LOG_FILE"
top -b -n1 | head -10 >> "$LOG_FILE"

echo "" >> "$LOG_FILE"
echo "Disk Usage" >> "$LOG_FILE"
df -h >> "$LOG_FILE"

echo "" >> "$LOG_FILE"
echo "Top Memory Processes" >> "$LOG_FILE"
ps aux --sort=-%mem | head -5 >> "$LOG_FILE"

echo "" >> "$LOG_FILE"
echo "Top CPU Processes" >> "$LOG_FILE"
ps aux --sort=-%cpu | head -5 >> "$LOG_FILE"

echo "=================================" >> "$LOG_FILE"
