#!/bin/bash
arg1=$1
do_the_job='mkswapfile'
# Zmienna size określa wielkość pliku wymiany
# size=2G
size=1G

#echo "\$0 to: $0"
#echo "\$1 to: $1"
#echo "\$2 to: $2"

swapfile="/swapfile"

if [[ -e $swapfile ]]; then
	echo "$swapfile exists!"
# Checking the swapfile is non-existing
elif [[ $do_the_job == $arg1 ]]; then
	echo "Tworzę swapfile w pliku $swapfile"
 	if [[ -z $(swapon --show=NAME) ]]; then
     		fallocate -l $size /swapfile && 
 		chmod 600 $swapfile &&
 		mkswap $swapfile
 		swapon $swapfile
		if [[ -z $(grep 'swap' < /etc/fstab) ]]; then
 			echo -e "$swapfile\tswap\tswap\tdefaults\t0\t0" >> /etc/fstab
		else
			echo "Wpis odnoszący się do swap już istnieje w /etc/fstab. Skontroluj zawartość /etc/fstab i wyedytuj go samodzielnie."
		fi
 	fi
else
	if [[ -z $(swapon --show=NAME) ]]; then
    		echo "Jeżeli wywołasz skrypt z argumentem $do_the_job, to wykonam polecenia:" &&
    		echo "fallocate -l $size /swapfile" &&
		echo "chmod 600 $swapfile" &&
		echo "mkswap $swapfile"
		echo "swapon $swapfile"
		echo "echo -e "$swapfile\tswap\tswap\tdefaults\t0\t0" >> /etc/fstab"
	fi
fi

swapon --show
