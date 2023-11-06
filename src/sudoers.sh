#!/usr/bin/env bash

# To write user's permissions under root's permissions in the file for readability reasons.
LINENUM=$(grep root -n /etc/sudoers | grep ALL | cut -d':' -f 1)
sed -i '${LINENUM}i\berk ALL=(ALL:ALL) ALL' /etc/sudoers
