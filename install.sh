#!/usr/bin/env sh

echo
cat << "EOF"
  Installing...
  ┌─────────────────────────────┐  
  │ ______ _____  ________  ___ │  
  │ |  _  \  _  ||  _  |  \/  | │  
  │ | | | | | | || | | | .  . | │  
  │ | | | | | | || | | | |\/| | │  
  │ | |/ /\ \_/ /\ \_/ / |  | | │  
  │ |___/  \___/  \___/\_|  |_/ │  
  │                             │  
  │    @peperoni's dotfiles     │  
  └─────────────────────────────┘  
EOF

echo -e "\n\e[31m>> Do you want to copy over configuration files automatically?\e[0m"
echo -e " (y/n) "
read install_config
if [ $install_config = "y" ]; then
	cp -rf ./.config/nvim ~/.config/nvim 
	cp -rf ./.config/fabric ~/.config/fabric 
	cp -rf ./.config/btop ~/.config/btop 
	cp -rf ./.config/cava ~/.config/cava
	cp -rf ./.config/hypr ~/.config/hypr
	cp -rf ./.config/mpv ~/.config/mpv 
	cp -rf ./.config/tmux~/.config/tmux 
	cp -rf ./.config/yazi ~/.config/yazi
	cp -rf ./.config/zathura ~/.config/zathura
	cp -rf ./.config/zsh ~/.config/zsh

	cp -f ./.config/starship.toml ~/.config/starship.toml
	cp -f ./.config/pacman.conf /etc/pacman.conf 
	cp -f ./.config/.zshenv ~/
  echo -e "\n\e[34m>> Configs have been installed!\e[0m"
else
  echo -e "\n\e[34m>> Okay! Skipped.\e[0m"
fi

echo -e "\n\e[31m>> Installing YaY AUR helper\e[0m"
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si
cd ..
rm -rf yay-bin
yay -Y --gendb
yay -Syu --devel --noconfirm
yay -Y --devel --save
echo -e "\n\e[34m>> DONE! \e[0m"

echo -e "\n\e[31m>> Do you want to install my package list for these dotfiles? This will provide you with each of the (necessary) applications I have installed.\e[0m"
echo -e " (y/n) "
read install_packages
if [ $install_packages = "y" ]; then
  yay -s --needed --noconfirm - < ./pacman/packages.txt
  echo -e "\n\e[34m>> packages have been installed!\e[0m"
else
  echo -e "\n\e[34m>> okay! skipped.\e[0m"
fi

echo -e "\n\e[31m>> Changing Shell to zsh...\e[0m"
chsh -s /bin/zsh
echo -e "\n\e[34m>> DONE! Will be available on next restart.\e[0m"

echo -e "\n\e[31m>> Granting user permisssions...\e[0m"
sudo usermod -aG input $USER
sudo usermod -aG seat $USER
echo -e "\n\e[34m>> DONE! \e[0m"

echo -e "\n\e[31m>> Starting processes...\e[0m"
sudo systemctl start ufw
sudo systemctl enable ufw
systemctl --user enable pipewire.service
systemctl --user start pipewire.service
systemctl --user enable wireplumber.service
systemctl --user start wireplumber.service
echo -e "\n\e[34m>> DONE! \e[0m"

echo -e "\n\e[31m>> Setting up firewall...\e[0m"
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw default deny incoming
sudo ufw default allow outgoing
echo -e "\n\e[31m>> Would you like to open the ssh port?\e[0m"
echo -e " (y/n) "
read ssh_enabled
if [ $ssh_enabled = "y" ]; then
  sudo ufw allow ssh
  echo -e "\n\e[34m>> ssh is exposed!\e[0m"
else
  echo -e "\n\e[34m>> okay! skipped.\e[0m"
fi
sudo ufw enable
sudo ufw status


cat << "EOF"
 ┌────────────────────────────────┐ 
 │ ______ _____ _   _  _____   _  │ 
 │ |  _  \  _  | \ | ||  ___| | | │ 
 │ | | | | | | |  \| || |__   | | │ 
 │ | | | | | | | . ` ||  __|  | | │ 
 │ | |/ /\ \_/ / |\  || |___  |_| │ 
 │ |___/  \___/\_| \_/\____/  (_) │ 
 │                                │ 
 └────────────────────────────────┘ 
EOF

nitch
