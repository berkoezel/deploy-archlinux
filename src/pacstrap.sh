#!/usr/bin/env bash

. ./00_VARS.sh

pacstrap -K /mnt ${DEPLOYARCH_PACSTRAP_PKGS} 
