#!/bin/bash

Addition() {
	local x=10
	local y=20
	local sum=$(($x+$y))
}

echo "====== Calling Addition Function(local Variables) ======="
Addition

echo "$x"
echo "$y"
echo "$sum"

product() {
	x=10
	y=20
	product=$(($x*$y))
}

echo "====== Calling Product Function(Global Variables) ======"
product

echo "$x"
echo "$y"
echo "$product"

echo "====== Updating the Global variable value ======="
x=$((x+10))
echo "$x"



