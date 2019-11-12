#!/bin/bash

# exit script if return code != 0
set -e

# define pacman packages
pacman_packages="python python-setuptools python-pip supervisor"

# install pre-reqs
pacman -Sy --needed $pacman_packages --noconfirm
#pip2 install --upgrade setuptools
pip install flexget
#pip2 install transmissionrpc

# call aor script (arch official repo)
# source /root/aur.sh

# cleanup
yes|pacman -Scc
rm -rf /usr/share/locale/*
rm -rf /usr/share/man/*
rm -rf /tmp/*
