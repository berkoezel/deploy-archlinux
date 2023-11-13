#!/usr/bin/env bash

. ./00_VARS.sh

pacman -S grub efibootmgr os-prober

TARGET_LINE=$(grep CMDLINE_LINUX_DEFAULT /etc/default/grub -n | cut -d : -f 1)
sed -i "${TARGET_LINE}d" /etc/default/grub

echo "" >> /etc/default/grub
echo "CMDLINE_LINUX_DEFAULT=${DEPLOYARCH_KERNEL_PARAMS}" >> /etc/default/grub

grub-install --target=x86_64-efi --boot-directory=/boot --efi-directory=/boot/efi
grub-mkconfig -o /boot/grub/grub.cfg
