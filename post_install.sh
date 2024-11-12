#!/bin/bash


confDir=${XDG_CONFIG_HOME:-$HOME/.config}
srcDir=$(dirname "$(realpath "$0")")

if [ ! -d ~/.config ]; then
    mkdir -p ~/.config
fi
if [ ! -d ~/.local/bin ]; then
    mkdir -p ~/.local/bin
fi




cat << "EOF"

#----------------------------------#
#            Last Steps            #
#----------------------------------#

EOF
mv "$srcDir"/wallpapers/ "$confDir"/
cp "$srcDir"/.xbindkeysrc "$srcDir"/.xinitrc ~/
cp "$srcDir"/set_wallpaper.sh ~/.local/bin/
cp ./.zshrc ./.zprofile ~/

