#!/bin/bash

<< Notice

This Script Creates an Archive of a folder &
deletes backups older than 14 days

Notice

source_dir=$1
backup_dir=$2
timestamp=$(date "+%Y-%m-%d")

[[ $# -ne 2 ]] && echo "Usage : ./backup.sh <source_path> <backup_path>" && exit 1

[[ ! -d $source_dir ]] && echo "============= $source_dir Directory Doesn't Exist =============" && exit 1

create_backup() {
	tar -czf $backup_dir/backup_$timestamp.tar.gz $source_dir 2>/dev/null
	tar -tzf $backup_dir/backup_$timestamp.tar.gz >/dev/null && echo "======== Archive Successfully Created ========"
	echo "======== Archive Details =========="
	echo "Archive_Name : $(du -h $backup_dir/backup_$timestamp.tar.gz | awk '{print $2}')"
	echo "Archive_Size : $(du -h $backup_dir/backup_$timestamp.tar.gz | awk '{print $1}')"
}

delete_backup() {
	find $backup_dir -name "*.tar.gz" -mtime +14 -exec rm {} \;
	echo "========== Deleted Backup files older than 14 days ============"
}

create_backup
delete_backup
