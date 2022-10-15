#!/bin/bash

rm -rf ~/DATA/Theme-Icon-Packs/

git clone https://github.com/Khori-Lee/Theme-Icon-Packs.git ~/DATA/Theme-Icon-Packs


cp -r ~/.icons/* ~/DATA/Theme-Icon-Packs/.icons/
cp -r ~/.themes/* ~/DATA/Theme-Icon-Packs/.themes/

echo

cd ~/DATA/Theme-Icon-Packs/

setup-git-v1.sh

echo

git-v3-auto.sh