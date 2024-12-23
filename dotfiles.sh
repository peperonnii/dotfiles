#!/bin/zsh
mkdir -p ~/dotfiles

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

sudo pacman -Qqe | tr '\n' ' ' > ~/dotfiles/packages.txt
echo "Backup completed."
