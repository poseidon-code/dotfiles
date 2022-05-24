#!/usr/bin/sh

# setup doas
su
source ./setup_doas.sh
su poseidon

# copy configuration
cp -prnv ../config/* $HOME/.config/ | grep '\->'
rm -rf $HOME/.config/tint2*

# install important packages
doas pacman -Syu --noconfirm unzip tar p7zip unrar lsd bat neovim btop starship neofetch wget go npm nodejs jdk-openjdk jre-openjdk python python-pip

# setup zsh
doas source ./setup_zsh.sh

# setup yay
doas source ./setup_yay.sh

# setup fonts
doas source ./setup_fonts.sh