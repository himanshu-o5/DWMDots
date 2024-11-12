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








cat << "EOF"

#--------------------------------#
# import variables and functions #
#--------------------------------#

EOF

give_space (){
    sleep 1
    cat << "EOF"




EOF
}
confDir=${XDG_CONFIG_HOME:-$HOME/.config}
srcDir=$(dirname "$(realpath "$0")")

if [ ! -d ~/.config ]; then
    mkdir -p ~/.config
fi
if [ ! -d ~/.local/bin ]; then
    mkdir -p ~/.local/bin
fi

echo "Source folder : $srcDir"
echo "Config folder : $confDir"

give_space










cat << "EOF"

#--------------------------------#
# Installing required Packages #
#--------------------------------#

EOF

# Define an array of package names
packages=("base-devel" "curl" "xorg" "xorg-xinit" "libxft" "libxinerama" "xcompmgr" "ttf-jetbrains-mono" "ttf-font-awesome" "feh" "firefox" "python-pywal" "zsh" "zsh-syntax-highlighting" "xdotool" "xbindkeys" "vim" "neovim" "jq" "brightnessctl" "pamixer" "wireless_tools")
missing_packages=()

# Check each package and add missing ones to missing_packages
for pkg in "${packages[@]}"; do
    if ! command -v "$pkg" &> /dev/null; then
        echo "$pkg is not installed. Appending..."
        missing_packages+=("$pkg")  
    else
        echo "$pkg is already installed."
    fi
    sleep 0.3
done

# Install all missing packages
if [ ${#missing_packages[@]} -gt 0 ]; then
    echo "Installing missing packages: ${missing_packages[*]}"
    sudo pacman -Syu --needed --noconfirm "${missing_packages[@]}"
else
    echo "All packages are already installed."
fi

give_space








cat << "EOF"

#----------------------------------#
# Installing DWM, DMenu, DWMBlocks #
#----------------------------------#

EOF

folders=("dwm" "dmenu" "st" "dwmblocks")
for folder in "${folders[@]}"; do 
    give_space
    cd "$srcDir"/"$folder"/
    sudo make clean install
    printf "\n$folder is now installed!!!"
    cd "$srcDir"/
done

# Setting some scripts for dwmblocks
if [ ! -d ~/.local/bin/ ]; then
    mkdir -p ~/.local/bin
fi
cp -r "$srcDir"/to.localbin/ ~/.local/bin/

give_space









cat << "EOF"

#----------------------------------#
#          Installing yay          #
#----------------------------------#

EOF
if command -v yay &> /dev/null; then
    printf "yay is already installed. Skipping... "
else
    git clone https://aur.archlinux.org/yay.git
    sudo chown -R "$USER":"$USER" ./yay
    cd yay
    makepkg -si --noconfirm
    cd "$srcDir"/
fi
give_space










cat << "EOF"

#----------------------------------#
#     Configuring ZSH terminal     #
#----------------------------------#

EOF
$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh) > ohmyzsh.sh
./ohmyzsh.sh
