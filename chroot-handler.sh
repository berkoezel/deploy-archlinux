#!/usr/bin/env bash

# This scripts copies all the needed scripts for the target chroot, 
# makes them chroot jail can find inside, and runs them in a particular order.

FILES=(00_VARS.sh set-timezone.sh set-locales.sh set-hostname.sh set-user.sh set-services.sh set-sudoers.sh set-swapfile.sh set-aurhelper.sh set-initramfs.sh set-bootloader.sh)

source 00_VARS.sh
for scr in "${FILES[@]/00_VARS.sh}"; do
	/chroot-scripts/$i
done

cd /
rm -rf /chroot-scripts

echo "Installation is complete. You can reboot your system now."
