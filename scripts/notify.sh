#!/bin/bash

message=$1
log_dir="/home/ubuntu/logguard/logs/notifications.log"

echo "$(date) : $message" >> $log_dir
