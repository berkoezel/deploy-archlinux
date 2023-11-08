#!/usr/bin/env bash

. ./00_VARS.sh

systemctl enable ${DEPLOYARCH_ENABLE_SVCS}
