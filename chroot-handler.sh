#!/usr/bin/env bash

# This scripts copies all the needed scripts for the target chroot, 
# makes them chroot jail can find inside.

SCRIPTS_TARGET_DIR='/mnt/chroot-scripts'
mkdir $SCRIPTS_TARGET_DIR

FILES=(00_VARS.sh settimezone.sh setlocales.sh sethostname.sh users.sh conf-hosts.sh enable-services.sh sudoers.sh genswapfile.sh set-aurhelper.sh set-firewall.sh set-hostname.sh initramfs.sh bootloader.sh)

for file in ${FILES[@]}; do
	cp ./$i $SCRIPTS_TARGET_DIR
done;

source 00_VARS.sh
for scr in "${FILES[@]/00_VARS.sh}"; do
	./$i
done
