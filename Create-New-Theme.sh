#!/bin/bash

cd ~/DATA/New-Device/Theming/arcolinux-arc-themes/

./1-get-the-necessary-software.sh

read -p "What is the Name of your Color: " colorname
read -p "What is the Hex code: " hex

sed -i '17s/(.*)/('${colorname^}')/; 
     33s/.*)/    '${colorname^}')/;
     34s/# .*/# '$hex'/;
     35s/".*"/"'${colorname^}'"/;
     36s/".*"/"'${hex//#}'"/' ./5-make-all-themes-for-arcolinux-tutorial.sh

./5-make-all-themes-for-arcolinux-tutorial.sh

sudo pacman -Runs gnome gnome-shell --noconfirm

cd /usr/share/xsessions/
sudo rm -f gnome*
sudo rm -f cinnamon*