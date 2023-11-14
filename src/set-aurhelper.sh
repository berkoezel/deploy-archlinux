#!/usr/bin/env bash

chmod 777 $PWD 
sudo -u berk git clone https://aur.archlinux.org/paru.git
cd paru
sudo -u berk makepkg -si
