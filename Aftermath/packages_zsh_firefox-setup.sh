#!/bin/sh

# Alle pakker
apk add neofetch git nautilus libuser docker docker-compose tlp sddm fcron syncthing firefox pipewire pipewire-pulse pavucontrol networkmanager wl-clipboard dbus-openrc gnome-calculator polkit-gnome brightnessctl pipewire-media-session xdg-desktop-portal-kde i3status fzf rclone rsync terminator unrar unzip zsh zsh-autosuggestions zsh-syntax-highlighting neovim gammastep btrfs-progs mousepad ark vlc spectacle htop plasma nodejs npm lsof zathura zathura-pdf-poppler eudev sway swaylock swayidle xf86-video-fbdev mesa-dri-gallium

# Pipewire
 mkdir /etc/pipewire
 cp /usr/share/pipewire/pipewire.conf /etc/pipewire/

# Services
for service in fcron syncthing rclone docker tlp; do
	rc-update add $service default
done

# User-groups
adduser fabsepi docker

# Zsh
lchsh fabsepi
lchsh

# Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

# Fonts
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
mv 'MesloLGS NF Regular.ttf' MesloLGS.ttf
wget https://www.opensans.com/download/open-sans.zip
unzip open-sans.zip

mkdir ~/.local/share/fonts
mv OpenSans-Regular.ttf ~/.local/share/fonts/OpenSans.ttf
mv MesloLGS.ttf ~/.local/share/fonts/MesloLGS.ttf

fc-cache -f -v

# Firefox; "toolkit.legacyUserProfileCustomizations.stylesheets" must be true in about:config
sh -c "$(curl -fsSL https://raw.githubusercontent.com/mut-ex/minimal-functional-fox/master/install.sh)"
