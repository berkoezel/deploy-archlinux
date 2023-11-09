#!/usr/bin/env bash

set -e
sudo su -
DEPLOYARCH_DIR=$(pwd)

cd src/

./setconfonts.sh
./verifyuefi.sh
./checkconn.sh
./settimezone.sh
./probedisks.sh
./conf-mirrors.sh
./pacstrap.sh
./setfstab.sh

