#!/bin/zsh

printf "(poseidon-code) Installing Fonts"

# JetBrains, Noto, Fira Code, Nerd from pacman
pacman -Syu --noconfirm noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ttf-jetbrains-mono ttf-fira-code ttf-nerd-fonts-symbols-mono

# Lexend, Poppins, Rubik, Nunito Sans, Teko, Space Mono from Google Fonts
declare -a fonts=("Lexend" "Poppins" "Rubik" "Nunito Sans" "Teko" "Space Mono")
for i in "${fonts[@]}"; do
    wget -q "https://fonts.google.com/download?family=$i" -O "$i.zip" >/dev/null 2>&1
    unzip -o -q "$i.zip" -d "/usr/share/fonts/$i/"
    rm -rf "$i.zip"
done

fc-cache -f
