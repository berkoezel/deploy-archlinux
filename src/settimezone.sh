#!/usr/bin/env bash

. ./00_VARS.sh

ln -sf /usr/share/zoneinfo/${DEPLOYARCH_TIMEZONE}/ /etc/localtime
