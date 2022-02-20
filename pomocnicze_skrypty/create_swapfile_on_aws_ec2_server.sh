#!/bin/bash

do_the_job=$1

swapfile = "/swapfile"

if [ -e $swapfile ]; then
	echo "$swapfile exists!"
# Checking the swapfile is non-existing
elseif [ $1 == "mkswapfile" ]; then
	echo "Tworzę swapfile w pliku $swapfile"
# 	if [ -z $(swapon --show=NAME) ]; then
#     		fallocate -l 2G /swapfile && 
# 		chmod 600 $swapfile &&
# 		mkswap $swapfile
# 		swapon $swapfile
# 		echo -e "$swapfile\tswap\tswap\tdefaults\t0\t0" >> /etc/fstab
# 	fi
else
	if [ -z $(swapon --show=NAME) ]; then
    		echo "fallocate -l 2G /swapfile" &&
		echo "chmod 600 $swapfile" &&
		echo "mkswap $swapfile"
		echo "swapon $swapfile"
		echo "echo -e "$swapfile\tswap\tswap\tdefaults\t0\t0" >> /etc/fstab"
	fi
fi

swapon --show
