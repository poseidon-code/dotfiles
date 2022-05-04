#!/bin/sh

printf "(poseidon-code) Installing zsh"

cp ../.zshrc ../.zshenv ../.zprofile $HOME/
cp ../.zshrc /root/

pacman -Syu zsh zsh-completions zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search

chsh $(which zsh)
chsh -s $(which zsh) $(whoami)

source $HOME/.zshrc
