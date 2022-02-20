#!/bin/bash
##############################################################################
# # Bash (watch out double square brackets!) script                          #
# # for create swapfile on AWS EC2 Ubuntu server                             #
# # Tested on Ubuntu 20.04 LTS                                               #
##############################################################################

arg1=$1
do_the_job='mkswapfile'
##############################################################################
# # Zmienna size określa wielkość pliku wymiany # size is swapfile size :)   #
# # size=2G                                                                  #
##############################################################################
size=1G
##############################################################################
# # For debugging purpose                                                    #
# #echo "\$0 to: $0"                                                         #
# #echo "\$1 to: $1"                                                         #
# #echo "\$2 to: $2"                                                         #
##############################################################################

swapfile="/swapfile"

##############################################################################
# # Checking the swapfile is non-existing # I'm sorry for my english :)      #
##############################################################################
if [[ -e $swapfile ]]; then
	echo "$swapfile exists!"
##############################################################################
## If swapfile is non exist, then check the argument1 is proper              #
## For now only accepted argument is 'mkswapfile' -                          #
## empty argument or any other is equivalent of help (it shows commands      #
## queue)                                                                    #
##############################################################################
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
##############################################################################
# #                                                                          #
# # If argument1 is not valid show command queue                             #
# #                                                                          #
##############################################################################
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
##############################################################################
# #                                                                          #
# # Always show "swapon --show"                                              #
# #                                                                          #
##############################################################################
swapon --show
