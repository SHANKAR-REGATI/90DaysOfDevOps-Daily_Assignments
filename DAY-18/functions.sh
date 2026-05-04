#!/bin/bash

greet() {
	echo "Hello $1!"
}

add() {
	Sum=$(($1+$2))
	echo "$Sum"
}

greet Shankar

add 12 13



