#!/bin/bash
sudo pacman -S --noconfirm libx11 \
	xcb-util \
	pixman \
	libconfig \
	libdbus \
	libgl \
	libev \
	libepoxy \
	uthash \
	meson \
	ninja \
	cmake \

cd ~
mkdir builds && cd builds

[ -d "picom" ] && rm -rf "picom"

git clone https://github.com/ibhagwan/picom.git

cd picom

clear
meson setup --buildtype=release build
ninja -C build install

clear
echo "deleting build folder"
rm -rf ~/builds

echo "picom installed."
picom --version



