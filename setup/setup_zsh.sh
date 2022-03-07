#!/bin/zsh

printf "(poseidon-code) Installing zsh"

cp ./.zshrc ./.zshenv ./.zprofile $HOME
cp ./.zshrc /root/

pacman -Syu zsh zsh-completion zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-match

chsh $(which zsh)
chsh -s $(which zsh) $(whoami)

. $HOME/.zshrc
