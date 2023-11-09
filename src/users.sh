#!/usr/bin/env bash

. ./00_VARS.sh

useradd ${DEPLOYARCH_SYSTEM_USER} -G wheel -s /bin/zsh -m
passwd ${DEPLOYARCH_SYSTEM_USER}
