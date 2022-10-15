#!/bin/bash

echo
color=${colorname^}

echo
echo "################################################################## "
echo "                          Renaming Folder                          "
echo "################################################################## "

mv ~/DATA/New-Device/Theming/mint-y-icons/mint-y-icons-master/usr/share/icons/Mint-Y-$color/ ~/DATA/New-Device/Theming/mint-y-icons/mint-y-icons-master/usr/share/icons/Surfn-Mint-Y-$color/

cd ~/DATA/New-Device/Theming/mint-y-icons/mint-y-icons-master/usr/share/icons/Surfn-Mint-Y-$color/places
rm -r *2x

echo
echo "################################################################## "
echo "                 Copying files and Update Index.theme              "
echo "################################################################## "

cp -r ~/DATA/New-Device/Theming/mint-y-icons/mint-y-icons-master/usr/share/icons/Mint-Y/Special_Icons/* ~/DATA/New-Device/Theming/mint-y-icons/mint-y-icons-master/usr/share/icons/Surfn-Mint-Y-$color

sed -i 's|Name=Surfn Mint Y|Name=Surfn Mint Y '$color'|' ~/DATA/New-Device/Theming/mint-y-icons/mint-y-icons-master/usr/share/icons/Surfn-Mint-Y-$color/index.theme 

echo
echo "################################################################## "
echo "                  Creating New Icon Theme Cache                    "
echo "################################################################## "
echo

cd ~/DATA/New-Device/Theming/mint-y-icons/mint-y-icons-master/usr/share/icons/Surfn-Mint-Y-$color/
sh ~/DATA/New-Device/Theming/mint-y-icons/mint-y-icons-master/usr/share/icons/Surfn-Mint-Y-$color/create-new-icon-theme.cache.sh

echo
echo "################################################################## "
echo "                Moving file to Icon themes Folder                  "
echo "################################################################## "

cd ~/.icons/
rm -r Surfn-Mint-Y-$color
cd ~/DATA/New-Device/Theming/mint-y-icons/mint-y-icons-master/usr/share/icons/
mv ~/DATA/New-Device/Theming/mint-y-icons/mint-y-icons-master/usr/share/icons/Surfn-Mint-Y-$color/ ~/.icons/

echo
echo "################################################################## "
echo "                             Finished                              "
echo "################################################################## "

