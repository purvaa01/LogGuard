#!/bin/bash

log_file="../logs/app.log"
mkdir -p ../logs

while true
do
    rand=$((RANDOM % 10))

    if [ $rand -lt 6 ]; then
        level="INFO"
        message="User logged in"
    elif [ $rand -lt 9 ]; then
        level="WARNING"
        message="Disk usage increasing"
    else
        level="ERROR"
        message="Failed API call"
    fi

    echo "$(date) - $level - $message" >> "$log_file"

    sleep 1
done
