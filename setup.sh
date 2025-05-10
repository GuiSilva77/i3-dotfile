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
    xorg-setxkbmap

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

echo "🧠 Dotfile environment installed. Ready to test polybar, i3, and startup behavior."

