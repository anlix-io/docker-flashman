#!/bin/bash

if [[ $EUID -ne 0 ]]
then
	echo "This script must be run as root" 
	exit 1
fi

mkdir -p /data/firmwares
mkdir -p /data/flashman-db
