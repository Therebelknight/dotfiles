#!/bin/bash

#yay
cd ~
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si

#rust
cd ~
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

#Update and Install packages
yay -Syyu - <pkglist_aur.txt
yay -Syyu - <pkglist.txt

#sddm theme
cd ~
sh -c "$(curl -fsSL https://raw.githubusercontent.com/keyitdev/sddm-astronaut-theme/master/setup.sh)"

#move all the configs
cd ~/.config
cp ~/dotfiles/config/ .
mkdir ~/.scripts ~/Wallpapers/
cp ~/dotfiles/scripts/* ~/.scripts
cp ~/dotfiles/Wallpapers/* ~/Wallpapers/

#fastcat themes
cd ~/.config
git clone --depth 1 https://github.com/m3tozz/FastCat.git && cd FastCat && bash ./fastcat.sh --shell

#dracula gtk stuff
cd ~
gsettings set org.gnome.desktop.interface gtk-theme Dracula
gsettings set org.gnome.desktop.interface icon-theme Dracula
gsettings set org.gnome.desktop.interface cursor-theme Dracula

#ohmyzsh
cd ~
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh
echo 'alias ls=eza' >>.zshrc
echo 'cat ~/.cache/wal/sequences' >>.zshrc
echo 'alias waypaper=waypaper --folder ~/Wallpapers/' >>.zshrc

reboot
