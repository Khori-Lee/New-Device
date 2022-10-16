#!/bin/bash

cd /tmp
rm -rf theme-icon-packs

git clone https://github.com/Khori-Lee/theme-icon-packs.git /tmp/theme-icon-packs
cp -r /tmp/theme-icon-packs/usr/share/icons/. ~/.icons
cp -r /tmp/theme-icon-packs/usr/share/themes/. ~/.themes

