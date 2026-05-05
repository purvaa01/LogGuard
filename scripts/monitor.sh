#!/bin/bash

log_file="../logs/app.log"
alert_file="../logs/alerts.log"

echo "Starting Log Monitoring.."

touch $alert_file

tail -Fn0 $log_file | while read line
do
	echo "$line"

	if echo "$line" | grep -q "ERROR"; then
		echo "ERROR detected: $line" | tee -a $alert_file
	fi

	
	if echo "$line" | grep -q "FAILED LOGIN"; then
		echo "Security Alert: $line" | tee -a $alert_file
	fi


	if echo "$line" | grep -q "WARNING"; then
		echo "Warning: $line" | tee -a $alert_file
	fi
done


