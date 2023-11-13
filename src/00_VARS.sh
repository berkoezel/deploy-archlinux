#!/usr/bin/env bash

# Swapfile generation
export DEPLOYARCH_SWAPLOCATION='/swapfile'
export DEPLOYARCH_SWAPFILE_SIZE='8' # In gigabytes 

# Hostname configuration
export DEPLOYARCH_HOSTNAME='archlinux'

# Ping pong service
export DEPLOYARCH_CHKPING_HOST='google.com'

# Pacman mirror location
export DEPLOYARCH_MIRROR_COUNTRY='CH' # Switzerland

# Pacstrap packages
export DEPLOYARCH_PACSTRAP_PKGS='base base-devel linux linux-firmware intel-ucode networkmanager less vim git'

# Partition sizing
export DEPLOYARCH_EFISIZE=512M
export DEPLOYARCH_BOOTSIZE=512M

# Timezone
export DEPLOYARCH_TIMEZONE=Etc/GMT+3

# Username
export DEPLOYARCH_SYSTEM_USER='berk'

# Services will enabled on the target installation
export DEPLOYARCH_ENABLED_SVCS='NetworkManager'

# initrd - mkinitcpio variables
export DEPLOYARCH_INITRD_HOOKS='encrypt'

# GRUB variables
export DEPLOYARCH_KERNEL_PARAMS='net.ifnames=0 fbcon=font:TER16x32'
