#!/bin/sh

sudo -v
. /etc/os-release

. ../base/install.sh

if [ "$ID" = "arch" ]; then
    echo "Running on Arch Linux"
    . install-arch/install-arch.sh
elif [ "$ID" = "fedora" ]; then
    echo "Running on Fedora"
    . install-fedora/install-fedora.sh
else
    echo "Running on another distro: $ID"
    echo "Please manually install the required programs"
fi

cp -a config/. ~/.config/