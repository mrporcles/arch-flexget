#!/bin/bash

# exit script if return code != 0
set -e

# define pacman packages
pacman_packages="python python-setuptools python-pip supervisor"

# install pre-reqs
pacman -Sy --needed $pacman_packages --noconfirm
pip install flexget

# cleanup
yes|pacman -Scc
rm -rf /usr/share/locale/*
rm -rf /usr/share/man/*
rm -rf /tmp/*

#fix flexget exists plugin
file="$(find /usr/lib -name exists.py)"
sed -i 's/walk/glob/; s/ignore/*/; s/errors=//' $file
