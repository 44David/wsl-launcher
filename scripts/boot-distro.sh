#!/bin/bash

if [ ! -d "C:/WSL-Distros" ]
    then
        cd C:/

        mkdir WSL-Distros
if [ -d "C:/WSL-Distros" ]
    then
        wsl --import ArchLinuxWSL C:/WSL-Distros archlinux.tar.gz

fi


distro = $2 
if [ $1 == "docker" ] && [ $? -eq 0 ]
    then 
        cd C:/wsldwnl-storage
        mkdir ${distro}-wsl-storage

        wsl --import distro C:/wsldwnl-storage ./${2}.tar

        wsl -d distro




fi