#!/bin/bash

<<Notice
This Script uses various functions to print system INFO
Notice

set -euo pipefail

Host_OS_INFO() {
	host=$(hostname -I)
	echo "Current Host : $host"

	os=$(uname)
	echo "Current OS : $os"
}

get_uptime() {
	echo "Uptime : $(uptime)"
}

disk_usage() {
	{
		df -h | head -n1 | awk '{print $1,$3,$6}'
	       	df -h | tail -n +2 | sort -k3 -rh | awk 'NR<=5 {print $1,$3,$6}'
}| column -t
}

memory_usage() {
	free -h | awk 'NR==2 {print $7}'
}

CPU_usage() {
	{
		ps -e -o pid,pcpu,comm | head -n1
		ps -e -o pid,pcpu,comm | tail -n +2 | sort -k2 -rh | awk 'NR<=5'
}
}

System_info() {
	echo "=====System INFO======"
	echo "=====Host & OS INFO======"
	Host_OS_INFO
	echo "=====Uptime INFO======"
	get_uptime
	echo "=====Top 5 Disk Usage====="
	disk_usage
	echo "====Available RAM======"
	memory_usage
	echo "====Top 5 CPU Consuming processes"
	CPU_usage
}

System_info
