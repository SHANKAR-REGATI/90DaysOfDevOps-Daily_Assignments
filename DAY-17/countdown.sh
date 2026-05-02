#!/bin/bash

read -p "Enter a Number b/w 1 & 10 : " Number

while [ $Number -ge 0 ]
do
	echo "$Number"
	if [ $Number -eq 0 ];then
		echo "Done!"
	fi
	Number=$((Number-1))
done



