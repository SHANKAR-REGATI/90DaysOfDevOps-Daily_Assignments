#!/bin/bash

read -p "Enter the file path to check whether file exist or not : " file

if [ -f $file ];then
	echo " File Exist "
else
	echo " File Doesn't Exist "
fi



