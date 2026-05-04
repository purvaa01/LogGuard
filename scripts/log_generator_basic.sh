#!/bin/bash

log_file="../logs/app.log"

levels=("INFO" "WARNING" "ERROR")

while true
do
    level=${levels[$RANDOM % 3]}

    if [[ "$level" == "INFO" ]]; then
        message="User logged in"
    elif [[ "$level" == "WARNING" ]]; then
        message="Disk usage increasing"
    else
        message="Failed API call"
    fi

    echo "$(date) - $level - $message" >> $log_file

    sleep 1
done
