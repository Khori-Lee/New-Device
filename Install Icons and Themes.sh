#!/bin/bash

cd /tmp
rm -rf Theme-Icon-Packs 

git clone https://github.com/Khori-Lee/Theme-Icon-Packs.git /tmp/Theme-Icon-Packs
cp -r /tmp/Theme-Icon-Packs/.icons/* ~/.icons
cp -r /tmp/Theme-Icon-Packs/.themes/* ~/.themes

