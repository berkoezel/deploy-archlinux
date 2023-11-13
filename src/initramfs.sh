#!/usr/bin/env bash

. ./00_VARS.sh

sed -i "s/consolefont block/consolefont ${DEPLOYARCH_INITRD_HOOKS} block/" /etc/mkinitcpio.conf 
mkinitcpio -P
