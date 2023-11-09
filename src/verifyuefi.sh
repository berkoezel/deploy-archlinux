#!/usr/bin/env bash

VAL=$(cat /sys/firmware/efi/fw_platform_size)

if [ ${VAL} == 64 ]; then
   exit 0;
else
   echo "ERROR: System is not booted in UEFI mode, aborting the installation."
   exit 1;
fi
