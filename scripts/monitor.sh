#!/bin/bash

log_file="../logs/app.log"
error_count=0

tail -Fn0 $log_file | while read line
do
	echo "$line"

	if [[ "$line" == *"ERROR"* ]]; then
		((error_count++))
		echo " ERROR detected! Count: $error_count"
	fi

	if [[ $line == *"WARNING"* ]]; then
		echo "WARNING detected!"
	fi

        if [ $error_count -ge 3 ]; then
        	echo "🔥 CRITICAL ALERT: Too many errors!" | tee -a ../logs/alerts.log
        	error_count=0
    	fi

done


