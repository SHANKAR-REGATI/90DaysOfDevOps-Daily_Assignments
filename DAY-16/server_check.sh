#!/bin/bash

Service="nginx"

read -p "Do You Want to Check $Service status, Enter y/n : " option

if [ $option = y ];then
	systemctl status $Service
	echo "==================="
	systemctl is-active $Service
else
	echo "Skipped"
fi


