#!/bin/bash


log_dir="/home/ubuntu/logguard/logs"
archive_dir="/home/ubuntu/logguard/archive"
temp_dir="/home/ubuntu/logguard/temp_logs"
s3_bucket="s3://logguard-archive-purva"

timestamp=$(date +%Y-%m-%d_%H-%M-%S)

archive_name="logs_$timestamp.tar.gz"

echo "Starting log archival"

mkdir -p $temp_dir

#find logs older than 7 days 
find $log_dir -name "*.log" -mtime +7 -exec mv {} $temp_dir/ \;

if [ "$(find $temp_dir -type f)" ]; then
       echo "old logs found. Creating archive"


 	#create zip archive
	tar -czf $archive_dir/$archive_name -C $temp_dir .

	echo "Archive created: $archive_name"

	#upload to s3
	aws s3 cp $archive_dir/$archive_name $s3_bucket/

	if [ $? -eq 0 ]; then
		echo "upload successful"

		#remove local archive after successful upload on s3
		rm -f $archive_dir/$archive_name

		rm -rf $temp_dir/*

		echo "Local cleanup completed."

	else
		echo "Upload Failed"
	fi
else
	echo "No logs are older than 7 days."
fi



