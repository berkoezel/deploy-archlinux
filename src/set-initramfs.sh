#!/usr/bin/env bash

. ./00_VARS.sh

sed -i "s/autodetect/autodetect keyboard keymap /" /etc/mkinitcpio.conf
sed -i "s/consolefont block/consolefont block encrypt /" /etc/mkinitcpio.conf 
mkinitcpio -p linux
