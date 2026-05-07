#!/bin/bash

threshold=1

usage=$(df / | grep / | awk '{print $5}' | sed 's/%//')

if [ "$usage" -gt "$threshold" ]; then
	./scripts/notify.sh "Disk usage exceeded threshold: ${usage}%"

	./scripts/archive_logs.sh
	
	./scripts/cleanup.sh

	./scripts/notify.sh "Log cleanup and archival completed successfully"
else
	./scripts/notify.sh "Disk usage normal: ${USAGE}%"

fi	
