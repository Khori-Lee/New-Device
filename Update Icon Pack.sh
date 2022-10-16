#!/bin/bash

rm -rf ~/DATA/theme-icon-packs/

git clone https://github.com/Khori-Lee/theme-icon-packs.git ~/DATA/theme-icon-packs


cp -r ~/.icons/* ~/DATA/theme-icon-packs/user/share/icons/
cp -r ~/.themes/* ~/DATA/theme-icon-packs/user/share/themes/

echo

cd ~/DATA/theme-icon-packs/

sh setup-git-v1.sh

echo

sh git-v3-auto.sh