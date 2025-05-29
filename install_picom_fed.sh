#!/bin/bash

sudo dnf install libXext-devel pcre-devel dbus-devel gcc git libconfig-devel libev-devel libX11-devel libX11-xcb libxcb-devel libGL-devel libEGL-devel libepoxy-devel meson pcre2-devel pixman-devel uthash-devel xcb-util-image-devel xcb-util-renderutil-devel xorg-x11-proto-devel xcb-util-devel

cd ~
mkdir builds && cd builds

[ -d "picom" ] && rm -rf "picom"

git clone https://github.com/ibhagwan/picom.git

cd picom


meson setup --buildtype=release build
ninja -C build install


echo "deleting build folder"
rm -rf ~/builds

echo "picom installed."
picom --version



