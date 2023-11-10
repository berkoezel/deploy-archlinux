#!/usr/bin/env bash

set -e
if [ "$(whoami)" != "root" ]; then
	echo "Please run this script as the root user."
	exit 1
fi

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

