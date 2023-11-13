#!/usr/bin/env bash

. ./00_VARS.sh

echo 'LANG=en_US.UTF-8' > /etc/locale.conf

echo 'en_US ISO-8859-1' >> /etc/locale.gen
echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen

echo 'tr_TR ISO-8859-9' >> /etc/locale.gen
echo 'tr_TR.UTF-8 UTF-8' >> /etc/locale.gen

locale-gen
