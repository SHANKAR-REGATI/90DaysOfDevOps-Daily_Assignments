#!/bin/bash

<< Notice

This Script Analyses a log file & 
Generates a Summary Report & 
Finally Moves the processed log file to a Archive directory

Notice

log_file=$1
timestamp=$(date "+%Y-%m-%d")
archive_dir=$2

[[ $# -ne 2 ]] && echo "Usage : ./log_analyzer.sh <log_file_path> <Archive_dir_path" && exit 1

[[ ! -f $log_file ]] && echo " $log_file File Doesn't Exist " && exit 1

err_count=$(grep -c "ERROR" $log_file)

critical=$(grep -n "CRITICAL" $log_file | sed 's/^\([0-9]*\):/Line \1:/')

err_occurance=$(grep "ERROR" sample.log | awk '{$1=$2=$3="";print}' | sort | uniq -c | sort -rn | head -5)

Summary_report() {
	echo " Date of Analysis : $timestamp "
	echo " Log File Name : $log_file "
	echo " Total Lines Processed : $(cat $log_file | wc -l) "
	echo " Total Error Count : $err_count "
	echo " ========= TOP 5 Error messages ======== "
	echo "$err_occurance"
	echo " ========= Critical Events ========= "
	echo "$critical"
}

Summary_report | tee log_report_$timestamp.txt

[[ -d $archive_dir ]] || mkdir -p $archive_dir

mv $log_file $archive_dir/

[[ $? -eq 0 ]] && echo " ======= Log file Moved to Archive Directory ======= "

