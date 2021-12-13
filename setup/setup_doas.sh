#!/bin/zsh

printf "(poseidon-code) Installing doas"

pacman -Syu opendoas
printf "permit persist :wheel" >> /etc/doas.conf
chown -c root:root /etc/doas.conf
chmod -c 0400 /etc/doas.conf
doas -C /etc/doas.conf && echo "doas config OK" || echo "doas config ERROR"
