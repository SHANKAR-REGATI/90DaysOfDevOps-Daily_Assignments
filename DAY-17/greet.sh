#!/bin/bash

if [ $# -eq 0 ];then
	echo "No Argument is Passed"
	echo "Usage: ./greet.sh <argument1>"
else
	echo " Hello $1! "
fi




