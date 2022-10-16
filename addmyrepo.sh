#!/bin/bash

#add my repos to pacman.conf and update database

read -p "Name of repo to Add: " name
echo
echo "################################################################"
echo "############## Added Entry below to pacman.conf ################"
echo "################################################################"
echo
echo '
['$name']
SigLevel = Optional TrustedOnly
Server = https://khori-lee.github.io/$repo/$arch' | sudo tee -a /etc/pacman.conf
echo
echo "################################################################"
echo "###################    Updating Database     ###################"
echo "################################################################"
echo
sudo pacman -Sy
echo
echo "################################################################"
echo "###################           Done           ###################"
echo "################################################################"
