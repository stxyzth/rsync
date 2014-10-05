#!/bin/bash
#
# Rsync script which enables user input for easier configuration.
#
#

# Checks to see Rsync is installed.
if [ -f "/usr/bin/rsync" ]; then
	echo "Rsync install found, continuing...."
else
	echo "Rsync is not found, please install"
	exit
fi

read -p "Enter the hostname/IP of the system you wish to transfer files too (e.g server.google.com): " hostname

read -p "Enter the SSH port of the system (e.g 22): " sshport

read -p "Enter the login username of the destination server: " username

read -p "Enter the directory/file you wish to transfer (e.g /home/username/file.zip): " directoryfrom

read -p "Enter the directory/file location where you want to transfer to: " directoryto




rsync -av --progress --inplace --bwlimit=4092 --rsh="ssh -p$sshport" $directoryfrom $username@$hostname:$directoryto