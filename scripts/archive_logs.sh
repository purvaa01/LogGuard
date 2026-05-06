#!/bin/bash


log_dir="/home/ubuntu/logguard/logs"
archive_dir="/home/ubuntu/logguard/archive"
s3_bucket="s3://logguard-archive-purva"

timestamp=$(date +%Y-%m-%d_%H-%M-%S)

archive_name="logs_$timestamp.tar.gz"

echo "Starting log archival"

#create zip archive
tar -czf $archive_dir/$archive_name $log_dir/*.log

echo "Archive created: $archive_name"

#upload to s3
aws s3 cp $archive_dir/$archive_name $s3_bucket/

if [ $? -eq 0 ]; then
	echo "upload successful"

	#remove local archive after successful upload on s3
	rm -f $archive_dir/$archive_name

	echo "Local archive removed"

else
	echo "Upload Failed"
fi

