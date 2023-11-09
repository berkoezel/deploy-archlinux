#!/usr/bin/env bash

. ./00_VARS.sh

timedatectl set-timezone ${DEPLOYARCH_TIMEZONE} 
hwclock --systohc
