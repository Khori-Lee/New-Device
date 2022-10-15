#!/bin/bash

echo
color=${colorname^}

echo
echo "################################################################## "
echo "                          Renaming Folder                          "
echo "################################################################## "

mv /home/lee/Desktop/Theming/mint-y-icons/mint-y-icons-master/usr/share/icons/Mint-Y-$color/ /home/lee/Desktop/Theming/mint-y-icons/mint-y-icons-master/usr/share/icons/Surfn-Mint-Y-$color/

cd /home/lee/Desktop/Theming/mint-y-icons/mint-y-icons-master/usr/share/icons/Surfn-Mint-Y-$color/places
rm -r *2x

echo
echo "################################################################## "
echo "                 Copying files and Update Index.theme              "
echo "################################################################## "

cp -r /home/lee/Desktop/Theming/mint-y-icons/mint-y-icons-master/usr/share/icons/Mint-Y/Special_Icons/* /home/lee/Desktop/Theming/mint-y-icons/mint-y-icons-master/usr/share/icons/Surfn-Mint-Y-$color

sed -i 's|Name=Surfn Mint Y|Name=Surfn Mint Y '$color'|' /home/lee/Desktop/Theming/mint-y-icons/mint-y-icons-master/usr/share/icons/Surfn-Mint-Y-$color/index.theme 

echo
echo "################################################################## "
echo "                  Creating New Icon Theme Cache                    "
echo "################################################################## "
echo

cd /home/lee/Desktop/Theming/mint-y-icons/mint-y-icons-master/usr/share/icons/Surfn-Mint-Y-$color/
sh /home/lee/Desktop/Theming/mint-y-icons/mint-y-icons-master/usr/share/icons/Surfn-Mint-Y-$color/create-new-icon-theme.cache.sh

echo
echo "################################################################## "
echo "                Moving file to Icon themes Folder                  "
echo "################################################################## "

cd /home/lee/.icons/
rm -r Surfn-Mint-Y-$color
cd /home/lee/Desktop/Theming/mint-y-icons/mint-y-icons-master/usr/share/icons/
mv /home/lee/Desktop/Theming/mint-y-icons/mint-y-icons-master/usr/share/icons/Surfn-Mint-Y-$color/ /home/lee/.icons/

echo
echo "################################################################## "
echo "                             Finished                              "
echo "################################################################## "

