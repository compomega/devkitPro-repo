#!/bin/bash
set -e

export DEVKITPRO=/opt/devkitpro
export DEVKITARM=${DEVKITPRO}/devkitARM
export DEVKITPPC=${DEVKITPRO}/devkitPPC   
export PATH=${DEVKITPRO}/tools/bin:$PATH

PACKAGE="${1}"

# Update dkp first
dkp-pacman --noconfirm -Sy
dkp-pacman --noconfirm -Syu

# Clone the package repository
git clone https://github.com/compomega/pacman-packages.git
cd pacman-packages

if [ ! -z "${2}" ]
then
    git checkout ${2}
fi

# Change the ownership
chown -R dkp:dkp .

# Build the package
cd "switch/${PACKAGE}"
su dkp -c 'dkp-makepkg --noconfirm -s'
cp switch-*.tar.xz /out/
