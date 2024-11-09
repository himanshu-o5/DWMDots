#!/bin/bash
set -e

cat << "EOF"

----------------------------------------------------------
        .                      _                    
       / \         _        __| |_      ___ __ ___  
      /^  \      _| |_     / _` \ \ /\ / / '_ ` _ \ 
     /  _  \    |_   _|   | (_| |\ V  V /| | | | | |
    /  | | ~\     |_|      \__,_| \_/\_/ |_| |_| |_|
   /.-'   '-.\            

----------------------------------------------------------

EOF


#--------------------------------#
# import variables and functions #
#--------------------------------#
confDir=${XDG_CONFIG_HOME:-$HOME/.config}
srcDir=$(dirname "$(realpath "$0")")



echo "Source folder : $srcDir"
echo "Config folder : $confDir"

# Installing Xorg
if ! pacman -Qi xorg &>/dev/null; then
    echo "xorg is not installed. Installing..."
    sudo pacman -S --noconfirm xorg xorg-xinit
else
    echo "xorg is already installed."
fi
