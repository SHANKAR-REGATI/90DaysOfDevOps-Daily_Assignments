#!/bin/bash

<< Notice

This Script Creates a Backup of log files older than 7 days & 
deletes backup files older than 30 days

Notice

log_dir=$1

[[ $# -ne 1 ]] && echo "Usage : ./log_rotate.sh <log_dir_path>" && exit 1

[[ ! -d $log_dir ]] && echo "======== $log_dir Directory Doesn't Exist =========" && exit 1

compress_files() {
	local count=$(find $log_dir -name "*.log" -mtime +7 | wc -l)
	find $log_dir -name "*.log" -mtime +7 -exec gzip {} \;
	echo "=========== Compressed $count files Successfully ==========="
}

delete_files() {
	local count=$(find $log_dir -name "*.gz" -mtime +30 | wc -l)
	find $log_dir -name "*.gz" -mtime +30 -exec rm {} \;
	echo "=========== Deleted $count .gz files Successfully ==========="
}

compress_files
delete_files
