#!/bin/bash

for pkg in nginx curl wget
do
	echo "============= $pkg Package ==============="
	if dpkg -s $pkg >/dev/null 2>&1 ;then
		echo "$pkg is already installed"
	else
		sudo apt update
		sudo apt install $pkg -y
		echo "============== $pkg Installed =============="
	fi
done



