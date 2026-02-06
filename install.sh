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
# Ensure keyrings dir exists
mkdir -p /etc/apt/keyrings
# Download public key
curl -fsSL https://packages.broadcom.com/artifactory/api/security/keypair/SaltProjectKey/public | sudo tee /etc/apt/keyrings/salt-archive-keyring.pgp
# Create apt repo target configuration
curl -fsSL https://github.com/saltstack/salt-install-guide/releases/latest/download/salt.sources | sudo tee /etc/apt/sources.list.d/salt.sources

apt update
apt-get install -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" -y --allow-change-held-packages salt-common

echo "Extracting resources..."
rm -rf /opt/siyasat-linux
tar -xzvf $DISTRO_PACKAGE -C /

echo "Provisioning Siyasat Linux.."
salt-call -l debug state.apply distro

