#!/usr/bin/env bash

# Swapfile generation
export DEPLOYARCH_SWAPFILE_SIZE='8'

# Hostname configuration
export DEPLOYARCH_HOSTNAME='archlinux'

# Ping pong service
export DEPLOYARCH_CHKPING_HOST='google.com'

# Pacman mirror location
export DEPLOYARCH_MIRROR_COUNTRY='Switzerland'

# Pacstrap packages
export DEPLOYARCH_PACSTRAP_PKGS='base base-devel linux linux-firmware intel-ucode networkmanager'

# Partition sizing
export DEPLOYARCH_EFISIZE=512M
export DEPLOYARCH_BOOTSIZE=512M

# Timezone
export DEPLOYARCH_TIMEZONE=Etc/GMT+3

# Username
export DEPLOYARCH_SYSTEM_USER='berk'
