#!/bin/bash


# install necessary dependencies and keyrings if not already installed
sudo apt-get -y -q update
sudo apt-get -y -q install curl gnupg cdebootstrap debian-archive-keyring tar

#create target directory
sudo mkdir -p ~/arch-installer
cd ~/arch-installer

# create a bootstrap of ISO using arch linux torrent
sudo cdebootstrap --arch amd64 ~/arch-installer/rootfs https://archlinux.org/releng/releases/2024.06.01/torrent/

# installs necessary packages in directory
sudo chroot ~/arch-installer/rootfs /bin/bash

apt-get update

apt-get clean
rm -rf /var/lib/apt/lists/*

exit 

# create tar.gz
sudo tar -czf arch-installer.tar.gz -C ~/arch-installer/rootfs .

echo "ISO image successfully bootstrapped"

echo "Copying arch-installer.tar.gz to windows machine..."

# copies the tar.gz onto windows

cd ~/arch-installer
cp arch-installer.tar.gz /mnt/c/Users/David/Onedrive/Desktop
    