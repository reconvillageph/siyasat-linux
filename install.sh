#!/bin/bash

DISTRO_NAME='siyasat-linux'
DISTRO_PACKAGE="$DISTRO_NAME.tar.gz"

if [ -f $DISTRO_PACKAGE ]; then
    echo Cleaning up distro package.
    rm -f $DISTRO_PACKAGE
fi

echo Building Siyasat Linux salt-state packages.
./build.sh

if [ `whoami` != "root" ]; then
	echo "Must be root."
	exit
fi

# some deps
echo "Installing some dependencies."
apt update && apt upgrade -y
apt install git curl -y

echo "Saltstack bootstrap..."
mkdir /etc/apt/keyrings >/dev/null 2>&1
curl -fsSL -o /etc/apt/keyrings/salt-archive-keyring-2023.gpg https://repo.saltproject.io/salt/py3/debian/12/amd64/SALT-PROJECT-GPG-PUBKEY-2023.gpg
echo "deb [signed-by=/etc/apt/keyrings/salt-archive-keyring-2023.gpg arch=amd64] https://repo.saltproject.io/salt/py3/debian/12/amd64/latest bookworm main" | tee /etc/apt/sources.list.d/salt.list

apt update
apt-get install -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" -y --allow-change-held-packages salt-common

echo "Extracting resources..."
rm -rf /opt/siyasat-linux
tar -xzvf $DISTRO_PACKAGE -C /

echo "Provisioning Siyasat Linux.."
salt-call -l debug state.apply distro

