#!/bin/sh

sudo apt update

#-----------------------------
# Pre-requisites 
#-----------------------------
sudo apt install g++ cmake make libboost-all-dev libasio-dev -y

#-----------------------------
# Install Crow
#-----------------------------
wget https://github.com/CrowCpp/Crow/releases/download/v1.2.1.2/Crow-1.2.1-Linux.deb
sudo dpkg -i Crow-1.2.1-Linux.deb

sudo rm -rf $(pwd)/Crow-1.2.1-Linux.deb