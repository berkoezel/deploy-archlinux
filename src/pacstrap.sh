#!/usr/bin/env bash

. ./00_VARS.sh

pacman -Sy
pacstrap -K /mnt ${DEPLOYARCH_PACSTRAP_PKGS} 
