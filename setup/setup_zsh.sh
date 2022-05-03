#!/bin/sh

printf "(poseidon-code) Installing zsh"

cp ../.zshrc ../.zshenv ../.zprofile /home/$(whoami)/
cp ../.zshrc /root/

pacman -Syu zsh zsh-completion zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-match

chsh $(which zsh)
chsh -s $(which zsh) $(whoami)

source /home/$(whoami)/.zshrc
