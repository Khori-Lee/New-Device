#!/bin/bash

#add my repos to pacman.conf and update database
#change address of the link variable below to your repo address ending .io leave of the actuall repo name
#eg https://khori-lee.github.io instead of https://khori-lee.github.io/yourreponame
link="https://khori-lee.github.io"

read -p "Name of repo to Add: " name
echo
echo "################################################################"
echo "############## Added Entry below to pacman.conf ################"
echo "################################################################"
echo
echo '
['$name']
SigLevel = Optional TrustedOnly
Server = '$link'/$repo/$arch' | sudo tee -a /etc/pacman.conf
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
