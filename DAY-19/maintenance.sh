#!/bin/bash

<< Notice

This Script Creates a backup of a folder &
Maintains only the latest 5 backups

Notice

source_dir=$1
backup_dir=$2
timestamp=$(date "+%Y-%m-%d-%H-%M-%S")

[[ $# -ne 2 ]] && echo "Usage : ./maintenance.sh <source_path> <backup_path> " && exit 1

[[ ! -d $source_dir ]] && echo " $source_dir Directory Doesn't Exist " && exit 1

create_backup() {
	tar -czf $backup_dir/backup_$timestamp.tar.gz $source_dir 2>/dev/null

	[[ $? -eq 0 ]] && echo "========= Backup created Successfully for $timestamp ==========="
}

perform_rotation() {
	backups=($(ls -t $backup_dir/backup_*))
	if [ "${#backups[@]}" -gt 5 ];then
		echo "========= Performing Rotation ==========="
		backups_to_remove=(${backups[@]:5})
		for backup in "${backups_to_remove}"
		do
			rm $backup
		done
	fi
}

Output() {
	create_backup
	perform_rotation
}

echo " $(date) : $(Output) " >> /var/log/maintenance.log

