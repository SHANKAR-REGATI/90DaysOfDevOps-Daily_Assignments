#!/bin/bash

check_disk() {
	df -h | awk 'NR==2 {print $4}'
}

check_memory() {
	free -h | awk 'NR==2 {print $7}'
}

disk_info() {
	echo "======= Available Disk Storage ======="
	check_disk
	echo "======= Available RAM ========"
	check_memory
}

disk_info



