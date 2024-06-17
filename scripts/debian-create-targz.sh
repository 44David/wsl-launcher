#!/bin/bash

# creates a clean debian install to run

# install necessary dependencies and keyrings if not already installed
sudo apt-get -y -q update
sudo apt-get -y -q install curl gnupg cdebootstrap debian-archive-keyring tar

#create target directory
sudo mkdir -p ~/debian-installer
cd ~/debian-installer

# create a bootstrap of ISO


sudo cdebootstrap --arch amd64 bookworm --include=vim,git,ssh,man,sudo,python3,nodejs,golang,docker,cpp, ~/debian-installer/rootfs http://deb.debian.org/debian

# installs necessary packages in directory
sudo chroot ~/debian-installer/rootfs /bin/bash

apt-get update

apt-get clean
rm -rf /var/lib/apt/lists/*


exit 

# create tar.gz
sudo tar -czf debian-installer.tar.gz -C ~/debian-installer/rootfs .

echo "ISO image successfully bootstrapped"

echo "Copying debian-installer.tar.gz to windows machine..."

# copies the tar.gz onto windows

cd ~/debian-installer
cp debian-installer.tar.gz /mnt/c/
    