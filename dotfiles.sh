#!/bin/zsh

mkdir -p ~/dotfiles

# Copy .config directory, .p10k.zsh, and .zshrc to ~/dotfiles
# Note: The -r flag is for recursive copying (for directories), and -rL follows symbolic links
cp -rL ~/.config/hypr ~/dotfiles/
cp -rL ~/.config/nvim ~/dotfiles/
cp -rL ~/.config/alacritty ~/dotfiles/
cp -rL ~/.config/astro ~/dotfiles/
cp -rL ~/.config/awesome ~/dotfiles/
cp -rL ~/.config/cava ~/dotfiles/
cp -rL ~/.config/discord ~/dotfiles/
cp -rL ~/.config/copyq ~/dotfiles/
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
cp -rL ~/.p10k.zsh ~/dotfiles/
cp -rL ~/.zshrc ~/dotfiles/

# Export the list of explicitly installed packages to packages.txt
# Note: This command requires sudo, so either run the script as a superuser or modify permissions as needed
sudo pacman -Qqe > ~/dotfiles/packages.txt

echo "Backup completed."

