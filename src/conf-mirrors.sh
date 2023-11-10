#!/usr/bin/env bash

. ./00_VARS.sh

curl -s 'https://archlinux.org/mirrorlist/?country=${DEPLOYARCH_MIRROR_COUNTRY}&protocol=http&protocol=https&ip_version=4' | sed 's/#Server/Server/' > /etc/pacman.d/mirrorlist

pacman -Sy
