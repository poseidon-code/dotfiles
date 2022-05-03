#!/bin/sh

printf "(poseidon-code) Installing Required Packages"

doas pacman -Syu --noconfirm unzip tar p7zip unrar wget go npm nodejs jdk-openjdk jre-openjdk python python-pip \
neovim bat lsd ranger neofetch starship moc nano firefox base base-devel btop git libdbusmenu-glib vlc telegram-desktop discord libreoffice-fresh \
latte kde-network-meta kde-system-meta kde-utilities-meta kde-accessibility-meta dolphin-plugins gwenview elisa ark okular spectacle konsole kate dolphin kmail packagekit packagekit-qt5 \
pipewire pipewire-alsa pipewire-pulse pipewire-jack xdg-desktop-portal xdg-desktop-portal-kde
doas pacman -Scc
doas pacman -Rsc $(pacman -Qdtq)

yay -Syu --noconfirm visual-studio-code-bin cava peaclock
yay -Scc
yay -Rs $(yay -Qdtq)

sudo systemctl enable --now pipewire-pulse.service