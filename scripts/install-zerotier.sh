#!/bin/bash

INSTALLER_PATH=/tmp/zerotier-installer

wget -O $INSTALLER_PATH https://www.zerotier.com/dist/ZeroTierOneInstaller-linux-x64
chmod +x $INSTALLER_PATH

$INSTALLER_PATH
