#!/usr/bin/env sh

rm -rf ./.config/*

#dirs
cp -rf ~/.config/nvim ./.config/nvim
cp -rf ~/.config/fabric ./.config/fabric
cp -rf ~/.config/btop ./.config/btop
cp -rf ~/.config/cava ./.config/cava
cp -rf ~/.config/hypr ./.config/hypr
cp -rf ~/.config/mpv ./.config/mpv
cp -rf ~/.config/tmux ./.config/tmux
cp -rf ~/.config/yazi ./.config/yazi
cp -rf ~/.config/zathura ./.config/zathura
cp -rf ~/.config/zsh ./.config/zsh
cp -rf ~/.config/starship.toml ./.config/
#files
cp -f ~/.zshenv ./.config/
sudo cp -f /etc/pacman.conf ./.config/pacman.conf
echo -e "\n\e[34m Configs copied\e[0m"

pacman -Qqe > pacman/packages.txt
echo -e "\n\e[34m Package list generated\e[0m"




