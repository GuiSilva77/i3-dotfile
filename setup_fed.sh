#!/bin/bash
set -e

echo "📦 Installing i3 environment with minimal setup..."

# Tooling 
sudo dnf group install development-tools

# Core packages
sudo dnf install -y \
    polybar \
    feh \
    flameshot \
    alacritty    

# Network: Using NetworkManager
sudo dnf install \
    NetworkManager \
    network-manager-applet \
    nm-connection-editor

sudo systemctl enable NetworkManager.service


# Audio: Using Pipewire as Fedora default
sudo dnf install \
    pipewire pipewire-pulse wireplumber \
    alsa-utils \
    pavucontrol \
    volumeicon
systemctl --user enable --now pipewire pipewire-pulse wireplumber

# Theme: Install breeze-dark and configure it
sudo dnf install \
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
sudo dnf install rofi firefox

echo "Enabling LightDM..."
sudo systemctl enable lightdm.service
echo "LightDM Enabled!"

echo "Setting i3 as XSession default..."
touch ~/.xsession
echo "exec i3" > ~/.xsession

echo "🧠 Dotfile environment installed. Ready to test polybar, i3, and startup behavior."

