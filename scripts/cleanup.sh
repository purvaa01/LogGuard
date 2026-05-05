#!/bin/bash

log_dir="/home/ubuntu/logguard/logs"

find $log_dir -type f -name "*.log" -mtime +7 -delete

