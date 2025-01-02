#!/bin/zsh
mkdir -p ~/dotfiles

rm -rf ~/dotfiles/hypr
rm -rf ~/dotfiles/mpv
rm -rf ~/dotfiles/tmux
rm -rf ~/dotfiles/yazi
rm -rf ~/dotfiles/cava
rm -rf ~/dotfiles/kitty
rm -rf ~/dotfiles/nvim
rm -rf ~/dotfiles/wal
rm -rf ~/dotfiles/zsh

cp -rL ~/.config/hypr ~/dotfiles/
cp -rL ~/.config/nvim ~/dotfiles/
cp -rL ~/.config/alacritty ~/dotfiles/
cp -rL ~/.config/awesome ~/dotfiles/
cp -rL ~/.config/cava ~/dotfiles/
cp -rL ~/.config/kitty ~/dotfiles/
cp -rL ~/.config/mpv ~/dotfiles/
cp -rL ~/.config/neofetch ~/dotfiles/
cp -rL ~/.config/ranger ~/dotfiles/
cp -rL ~/.config/rofi ~/dotfiles/
cp -rL ~/.config/waybar ~/dotfiles/
cp -rL ~/.config/tmux ~/dotfiles/
cp -rL ~/.config/swaylock ~/dotfiles/
cp -rL ~/.config/wal ~/dotfiles/
cp -rL ~/.config/yazi ~/dotfiles/
cp -rL ~/.config/zsh ~/dotfiles/
cp -rL ~/.config/mpv ~/dotfiles/
cp -rL ~/.config/starship.toml ~/dotfiles/


sudo pacman -Qqe | tr '\n' ' ' > ~/dotfiles/packages.txt
echo "Backup completed."
