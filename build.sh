#!/bin/bash

DISTRO_PACKAGE=siyasat-linux.tar.gz

if [ -f $DISTRO_PACKAGE ]; then
    rm $DISTRO_PACKAGE
fi

cd distro
tar -czvf ../$DISTRO_PACKAGE * 
cd ..
