#!/bin/bash

# assuming use of debian-based distro

# install necessary dependencies and keyrings if not already installed


# docker installation
sudo apt-get -y -q update
sudo apt-get install ca-certificates curl gnupg cdebootstrap debian-arch-keyring tar
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get -y -q update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo docker run hello-world


if [ $? -eq 0 ]
    then 

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

else
    echo "Building Arch Linux failed."

fi
    