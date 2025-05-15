#!/bin/bash
set -e

echo "📦 Installing i3 environment with minimal setup..."

# Tooling 
sudo pacman -S --noconfirm base-devel git less

# Core packages
sudo pacman -Syu --noconfirm \
    i3-gaps \
    polybar \
    feh \
    xss-lock \
    i3lock \
    dmenu \
    flameshot \
    xorg-xrandr \
    dex \
    lxsession \
    xterm \
    ttf-hack-nerd \
    xorg-setxkbmap \
    lightdm \
    lightdm-gtk-greeter \
    lightdm-gtk-greeter-settings \
    alacritty    

# Network: Using NetworkManager
sudo pacman -S --noconfirm \
    networkmanager \
    network-manager-applet \
    nm-connection-editor

sudo systemctl enable NetworkManager.service


# Audio: Using Pipewire as Fedora default
sudo pacman -S --noconfirm \
    pipewire pipewire-pulse wireplumber \
    alsa-utils \
    pavucontrol \
    volumeicon
systemctl --user enable --now pipewire pipewire-pulse wireplumber

# Theme: Install breeze-dark and configure it
sudo pacman -S --noconfirm \
	breeze-gtk breeze-icons

mkdir -p ~/.config/gtk-3.0
cat > ~/.config/gtk-3.0/settings.ini <<EOF
[Settings]
gtk-theme-name=Breeze-Dark
gtk-icon-theme-name=breeze-dark
gtk-font-name=Sans 10
EOF
echo 'gtk-theme-name="Breeze-Dark"' > ~/.gtkrc-2.0
echo 'gtk-icon-theme-name="breeze-dark"' >> ~/.gtkrc-2.0


# Optional / Quality-of-life
sudo pacman -S --noconfirm \
    i3status \
    rofi \
    firefox

echo "Enabling LightDM..."
sudo systemctl enable lightdm.service
echo "LightDM Enabled!"

echo "Setting i3 as XSession default..."
touch ~/.xsession
echo "exec i3" > ~/.xsession

echo "🧠 Dotfile environment installed. Ready to test polybar, i3, and startup behavior."

