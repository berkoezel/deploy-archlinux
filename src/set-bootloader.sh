#!/usr/bin/env bash

. ./00_VARS.sh

pacman -S grub efibootmgr os-prober

TARGET_LINE=$(grep -wn GRUB_CMDLINE_LINUX /etc/default/grub | cut -d : -f 1)
sed -i "${TARGET_LINE}d" /etc/default/grub

ROOTDISK_UUID=$(head -n3 /chroot-scripts/PARTS | tail -1 | xargs blkid | awk '{print $2}' | sed "s/\"//g") 
echo ${ROOTDISK_UUID}

echo "" >> /etc/default/grub
echo "GRUB_CMDLINE_LINUX=\"cryptdevice=${ROOTDISK_UUID}:cr_root root=/dev/mapper/cr_root ${DEPLOYARCH_KERNEL_PARAMS}\"" >> /etc/default/grub

grub-install --target=x86_64-efi --boot-directory=/boot --efi-directory=/boot/efi
grub-mkconfig -o /boot/grub/grub.cfg
