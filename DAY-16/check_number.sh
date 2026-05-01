#!/bin/bash

read -p "Give Any Number : " Number

if [ $Number -gt 0 ];then
	echo "Given Number is positive"
elif [ $Number -lt 0 ];then
	echo "Given Number is Negative"
else
	echo "Given Number is 0"
fi


