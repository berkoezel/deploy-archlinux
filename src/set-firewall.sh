#!/usr/bin/env bash

pacman -S ufw
ufw disable
ufw default allow outgoing
ufw default deny incoming
ufw deny ssh
ufw enable
