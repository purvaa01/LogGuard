#!/bin/bash

log_dir="/home/ubuntu/logguard/logs"
archive_dir="/home/ubuntu/logguard/archive"

mkdir -p $archive_dir

# compress logs older than 7 days
find $log_dir -type f -name "*.log" -mtime +7 -exec gzip {} \;

# move zips logs to archive
find $log_dir -type f -name "*.gz" -exec mv {} $archive_dir \;


