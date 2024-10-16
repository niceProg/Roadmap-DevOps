#!/bin/bash

# Function to display usage instructions
usage() {
    echo "Usage: $0 <log-directory>"
    exit 1
}

# Check if the user has provided a log directory
if [ $# -ne 1 ]; then
    usage
fi

# Variables
LOG_DIR=$1
ARCHIVE_DIR="/workspaces/Roadmap-DevOps/log-archive-tool"  # Change this directory if you want a different location for archives
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_NAME="logs_archive_${TIMESTAMP}.tar.gz"
LOG_FILE="${ARCHIVE_DIR}/archive_log.txt"

# Create archive directory if it doesn't exist
mkdir -p "$ARCHIVE_DIR"

# Check if the log directory exists
if [ ! -d "$LOG_DIR" ]; then
    echo "Error: Log directory $LOG_DIR does not exist."
    exit 1
fi

# Compress the logs into a tar.gz archive
tar -czf "${ARCHIVE_DIR}/${ARCHIVE_NAME}" -C "$LOG_DIR" .

# Check if compression was successful
if [ $? -eq 0 ]; then
    echo "Logs successfully archived to ${ARCHIVE_DIR}/${ARCHIVE_NAME}"
else
    echo "Error: Failed to archive logs."
    exit 1
fi

# Log the archive date and time to the log file
echo "[$(date)] Archived logs from $LOG_DIR to ${ARCHIVE_DIR}/${ARCHIVE_NAME}" >> "$LOG_FILE"
