#!/bin/zsh

printf "(poseidon-code) Installing Required Packages"

doas pacman -Syu --noconfirm unzip tar p7zip unrar wget go npm nodejs jdk-openjdk jre-openjdk python python-pip neovim bat lsd ranger neofetch lsd
doas pacman -Scc
doas pacman -Rs $(pacman -Qdtq)

yay -Syu --noconfirm visual-studio-code-bin cava mocp peaclock
yay -Scc
yay -Rs $(yay -Qdtq)
