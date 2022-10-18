#!/bin/bash
set -e

echo "################################################################"
echo "##############    Installing neccessary files    ###############"
echo "################################################################"

sudo pacman -S --noconfirm docbook-xsl 
sudo pacman -S --noconfirm plymouth
sudo pacman -S --noconfirm plymouththeme-cat-git 


echo
echo "################################################################"
echo "#############   Updating Grub Kernel Parameters   ##############"
echo "################################################################"
echo

sudo sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT=".*"/GRUB_CMDLINE_LINUX_DEFAULT="quiet loglevel=3 splash udev.log_priority=3 vt.global_cursor_default=1 audit=0 nvme_load=yes"/' /etc/default/grub

if [ $? -eq 0 ]; then 
echo "Grub updated Successful"
else 
echo "Grub update Failed"
fi 

echo
echo "################################################################"
echo "#############   Creating Backup and moving files  ##############"
echo "################################################################"
echo

[ -f /etc/mkinitcpio.conf ] || sudo touch /etc/mkinitcpio.conf
[ -f /etc/plymouth/plymouthd.conf ] || sudo touch /etc/plymouth/plymouthd.conf

sudo mv  /etc/mkinitcpio.conf /etc/mkinitcpio.conf.bak
sudo mv  /etc/plymouth/plymouthd.conf  /etc/plymouth/plymouthd.conf.bak

if [ $? -eq 0 ]; then 
echo "Files Backup Successful"
else 
echo "Files Backup Failed"
fi 

echo
echo "Updated mkinitcpio.conf file"
sudo cp  /usr/share/plymouth/themes/PlymouthTheme-Cat/config/mkinitcpio.conf /etc
echo

echo "################################################################"
echo "#############           Available Themes          ##############"
echo "################################################################"
echo

plymouth-set-default-theme -l

echo
read -p "What theme do you want to set as default: " theme

sudo sed -i '3s/Theme=.*/Theme='$theme'/' /usr/share/plymouth/themes/PlymouthTheme-Cat/config/plymouthd.conf
echo
if [ $? -eq 0 ]; then 
echo "Theme Updated to "$theme 
else 
echo "Theme Update Failed"
fi 

sudo cp  /usr/share/plymouth/themes/PlymouthTheme-Cat/config/plymouthd.conf /etc/plymouth
echo

if [ $? -eq 0 ]; then 
echo "File Move Successful"
else 
echo "File Move Failed"
fi 

echo
echo "################################################################"
echo "#####   Updating DisplayManager to DisplayManger-plymouth  #####"
echo "################################################################"
echo

read -p "Display Manager # ? (sddm:1/lightdm:2/lxdm:3): " dpm

if [ $dpm -eq 1 ]; then
selection="sddm"
elif [ $dpm -eq 2 ] ;
then
selection="lightdm"
elif [ $dpm -eq 3 ] ;
then
selection="lxdm"
fi

sudo systemctl disable $selection

echo
sudo systemctl enable $selection-plymouth

echo
echo "################################################################"
echo "#######  Updating Initramfs and Regenerating grub-config  #######"
echo "################################################################"
echo
sudo plymouth-set-default-theme -R $theme
sudo mkinitcpio -P linux && sudo grub-mkconfig -o /boot/grub/grub.cfg

sudo rm -r /usr/share/plymouth/themes/PlymouthTheme-Cat/config/
echo
echo "################################################################"
echo "###################           Done           ###################"
echo "################################################################"


# sudo plymouth-set-default-theme -R PlymouthTheme-Cat

# 