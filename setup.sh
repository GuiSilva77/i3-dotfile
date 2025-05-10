#!/bin/bash
set -e

echo "📦 Installing i3 environment with minimal setup..."

# Tooling 
sudo pacman -S --noconfirm base-devel git

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
    xfce4-terminal    

# Audio: Using Pipewire as Fedora default
sudo pacman -S --noconfirm \
    pipewire pipewire-pulse wireplumber \
    alsa-utils \
    pavucontrol

# Optional / Quality-of-life
sudo pacman -S --noconfirm \
    i3status \
    rofi \
    picom

echo "Enabling LightDM..."
sudo systemctl enable lightdm.service
echo "LightDM Enabled!"

echo "Setting i3 as XSession default..."
mkdir -p ~/.xsession
echo "exec i3" > ~/.xsession


echo "🧠 Dotfile environment installed. Ready to test polybar, i3, and startup behavior."

