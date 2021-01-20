#!/usr/bin/env bash
set -e

# curl -fsSL https://raw.githubusercontent.com/bokub/i3-config/master/quick-install.sh | bash

sudo apt update

# Just in case
sudo apt install -y git wget

# Install i3-gaps dependencies
sudo apt install -y meson libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev \
libxcb-util0-dev libxcb-icccm4-dev libyajl-dev \
libstartup-notification0-dev libxcb-randr0-dev \
libev-dev libxcb-cursor-dev libxcb-xinerama0-dev \
libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev \
autoconf libxcb-xrm0 libxcb-xrm-dev automake libxcb-shape0-dev

# Build i3-gaps from source
cd && git clone https://www.github.com/Airblader/i3 i3-gaps && cd i3-gaps
mkdir -p build && cd build
meson ..
ninja
meson install

# Build i3blocks from source
cd && git clone https://github.com/vivien/i3blocks
cd i3blocks
./autogen.sh
./configure
make
sudo make install
git clone https://github.com/vivien/i3blocks-contrib ~/.config/i3blocks

# Install other tools
sudo apt install -y rofi compton nitrogen xdotool dunst lm-sensors

# Download and install font-awesome
sudo mkdir -p /usr/share/fonts/opentype/font-awesome
sudo wget https://git.io/JvHi9 -O '/usr/share/fonts/opentype/font-awesome/Font Awesome 5 Free-Solid-900.otf'

# Override config
mkdir -p ~/.config && cd ~/.config && rm -fr i3
git clone https://github.com/bokub/i3-config.git i3

# Download and set wallpaper
mkdir -p ~/wallpapers
wget https://git.io/Jv7wA -O ~/wallpapers/blue_pink_gradient.jpg
nitrogen --save --set-scaled ~/wallpapers/blue_pink_gradient.jpg --head=0 && sleep 0.5
nitrogen --save --set-scaled ~/wallpapers/blue_pink_gradient.jpg --head=1

# Install Starship
cd && wget https://starship.rs/install.sh -O install_starship.sh
bash install_starship.sh -y
echo 'eval "$(starship init bash)"' >> .bashrc
echo 'eval "$(starship init zsh)"' >> .zshrc
rm install_starship.sh

# Install Snazzy theme for gnome-terminal
cd && git clone https://github.com/tobark/hyper-snazzy-gnome-terminal.git snazzy
chmod +x snazzy/hyper-snazzy.sh
./snazzy/hyper-snazzy.sh || echo -e "\e[33mCould not install Snazzy color scheme..."

# Install Dracula theme for GTK
cd /usr/share/themes
sudo wget https://github.com/dracula/gtk/archive/master.zip -O dracula.zip
sudo unzip dracula.zip
sudo mv gtk-master Dracula
echo "[Settings]
gtk-theme-name=Dracula" > ~/.config/gtk-3.0/settings.ini

# Install flameshot
sudo apt install -y flameshot
mkdir ~/Screenshots

# Cleanup
cd && rm -fr i3-gaps i3blocks snazzy Font-Awesome

echo -e "\e[32mSuccess !"
