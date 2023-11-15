#!/usr/bin/env bash

. ./00_VARS.sh
dd if=/dev/zero of=${DEPLOYARCH_SWAPLOCATION} bs=1024 count=$((1048576*${DEPLOYARCH_SWAPFILE_SIZE})) status=progress

chmod 600 ${DEPLOYARCH_SWAPLOCATION}
mkswap ${DEPLOYARCH_SWAPLOCATION}
swapon ${DEPLOYARCH_SWAPLOCATION}

echo ${DEPLOYARCH_SWAPLOCATION} 'swap swap defaults 0 0' >> /etc/fstab
