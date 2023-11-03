#!/usr/bin/env bash

echo "WARNING: A \"WHOLE\" disk will be used for the installation."
echo "Please choose a BLOCK DEVICE (not a partition) from the list below:"
lsblk -fp
echo -n "Enter the selected block device: "
read BLKDEVICE
BLKDEVICE=$(echo ${BLKDEVICE} | cut -f 1 -d " ")
CHKDEV=$(lsblk -dp | grep ${BLKDEVICE})

while [ -z ${CHKDEV} ]; do
   echo "You just entered wrong block device."
   echo -n "Enter the selected block device: "
   read BLKDEVICE
done

echo "Altering the disk table..."
dd if=/dev/zero of=${BLKDEVICE} bs=4096 count=1

echo "Creating GPT..."
(
   echo g
   echo w
) | fdisk ${BLKDEVICE}

echo "Creating EFI partition..."
(
   echo n
   echo p
   echo 
   echo
   echo +512M
   echo w
) | fdisk ${BLKDEVICE}

echo "Creating /boot partition..."
(
   echo n
   echo p
   echo
   echo
   echo +512M
   echo w
) | fdisk ${BLKDEVICE}

echo "Creating root filesystem partition..."
(
   echo n
   echo p
   echo
   echo
   echo
   echo w
) | fdisk ${BLKDEVICE}

EFIPART=$(lsblk -lp ${BLKDEVICE} | grep part | awk "{ print $1 }" | awk NR==1)
BOOTPART=$(lsblk -lp ${BLKDEVICE} | grep part | awk "{ print $1 }" | awk NR==2)
ROOTPART=$(lsblk -lp ${BLKDEVICE} | grep part | awk "{ print $1 }" | awk NR==3)

echo "Initializing cryptsetup..."
cryptsetup -y -v luksFormat ${ROOTPART}

echo "Attempting to open the encrypted filesystem..."
cryptsetup open ${ROOTPART} mntroot

echo "Creating filesystems..."

echo "Creating FAT32 (EFI) filesystem on ${EFIPART}"
mkfs.fat -F32 ${EFIPART}

echo "Creating ext4 (/boot) filesystem on ${BOOTPART}"
mkfs.ext4 ${BOOTPART}

echo "Creating ext4 (/) filesystem on /dev/mapper/mntroot..."
mkfs.ext4 /dev/mapper/mntroot

echo "Mounting filesystems..."
mount -v /dev/mapper/mntroot /mnt
mkdir /mnt/boot/efi -p
mount -v ${EFIPART} /mnt/boot/efi
mount -v ${BOOTPART} /mnt/boot
