#!/bin/zsh

printf "(poseidon-code) Installing yay"

git clone https://aur.archlinux.org/yay
cd ./yay/
makepkg -si
cd ..
rm -rf ./yay
yay -Syyuu
yay -Scc
yay -Rs $(yay -Qdtq)
