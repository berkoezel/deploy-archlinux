#!/usr/bin/env bash

curl -s 'https://archlinux.org/mirrorlist/?country=CH&protocol=http&protocol=https&ip_version=4' | sed 's/#Server/Server/' > /etc/pacman.d/mirrorlist
pacman -Sy
