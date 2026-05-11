#!/bin/bash

<< Notice

This Script Checks The Server Health

Notice

disk_usage() {
	{
		df -h | head -n1 | awk '{print $1,$4,$6}'
		df -h | tail -n +2 | sort -k3 -rh | awk 'NR<=5 {print $1,$4,$6}'
}| column -t
}

memory_usage() {
	free -h | awk 'NR==2 {print $7}'
}

CPU_usage() {
	{
		ps -e -o pid,pcpu,comm | head -n1
		ps -e -o pid,pcpu,comm | tail -n +2 | sort -k2 -rh | awk 'NR<=5'
}| column -t
}

get_uptime() {
	echo "Uptime : $(uptime)"
}

Server_check() {
	echo "========= Top 5 disk Usage ========"
	disk_usage
	echo "========= Available RAM ========="
	memory_usage
	echo "========= Top 5 CPU consuming processes =========="
	CPU_usage
	echo "======== Uptime Info ========="
	get_uptime
}

Server_check
