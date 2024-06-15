#!/bin/bash

if [ ! -d "C:/WSL-Distros" ]
    then
        cd C:/

        mkdir WSL-Distros
if [ -d "C:/WSL-Distros" ]
    then
        wsl --import ArchLinuxWSL C:/WSL-Distros archlinux.tar.gz
