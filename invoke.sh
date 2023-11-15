#!/usr/bin/env bash

set -e
if [ "$(whoami)" != "root" ]; then
	echo "Please run this script as the root user."
	exit 1
fi

cd src/

./set-consfont.sh
./verifyuefi.sh
./checckconn.sh
./set-timezone.sh
./set-disks.sh
./set-mirrors.sh
./pacstrap.sh
./set-fstab.sh

cd ../
cp -r ./* /mnt/chroot-scripts/ 
arch-chroot /mnt /bin/bash -c "/mnt/chroot-scripts/chroot-handler.sh"
