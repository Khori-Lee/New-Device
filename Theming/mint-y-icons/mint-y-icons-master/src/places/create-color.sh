#!/bin/bash

read -p "Type Colorname in lowercase: " colorname
read -p "Color Hex without #: " hex

#this works newcol="COLORS['"$colorname"']"=""'"'$hex'"'""
newcol="COLORS['"$colorname"']"=""'"'$hex'"'""

# = '"66a8cb"'

sed -i '20 a '$newcol'' ~/DATA/New-Device/Theming/mint-y-icons/mint-y-icons-master/src/places/generate-color-variations.py

python3 ./generate-color-variations.py 

cd ~/DATA/New-Device/Theming/mint-y-icons/mint-y-icons-master/src/

color=${colorname^}

sed -i 's/colors \= \[/colors \= \["'$color'",/ ' ~/DATA/New-Device/Theming/mint-y-icons/mint-y-icons-master/src/render_places.py 
sed -i 's/color can be:/color can be: '$color',/ ' ~/DATA/New-Device/Theming/mint-y-icons/mint-y-icons-master/src/render_places.py 

python3 ./render_places.py $color

cd ~/DATA/New-Device/Theming/mint-y-icons/mint-y-icons-master/src/

export colorname

sh ~/DATA/New-Device/Theming/mint-y-icons/mint-y-icons-master/src/complete_icon_theme.sh
