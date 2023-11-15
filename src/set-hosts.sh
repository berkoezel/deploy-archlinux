#!/usr/bin/env bash

. ./00_VARS.sh

echo '127.0.0.1 localhost' > /etc/hosts
echo '127.0.1.1' ${DEPLOYARCH_HOSTNAME} >> /etc/hosts

echo '::1 localhost ip6-localhost ip6-loopback' >> /etc/hosts
