#!/usr/bin/env bash
set -e

# curl -fsSL https://raw.githubusercontent.com/bokub/i3-config/master/quick-install.sh | bash

sudo apt update

# Just in case
sudo apt install -y git wget autoconf

# Install Regolith
wget -qO - https://regolith-desktop.org/regolith.key | \
gpg --dearmor | sudo tee /usr/share/keyrings/regolith-archive-keyring.gpg > /dev/null
echo deb "[arch=amd64 signed-by=/usr/share/keyrings/regolith-archive-keyring.gpg] \
https://regolith-desktop.org/release-ubuntu-jammy-amd64 jammy main" | \
sudo tee /etc/apt/sources.list.d/regolith.list
sudo apt update
sudo apt install -y regolith-desktop i3xrocks-battery
sudo apt upgrade

# # Install i3-gaps dependencies
# sudo apt install -y meson libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev \
# libxcb-util0-dev libxcb-icccm4-dev libyajl-dev \
# libstartup-notification0-dev libxcb-randr0-dev \
# libev-dev libxcb-cursor-dev libxcb-xinerama0-dev \
# libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev \
# autoconf libxcb-xrm0 libxcb-xrm-dev automake libxcb-shape0-dev

# # Build i3-gaps from source
# cd && git clone https://www.github.com/Airblader/i3 i3-gaps && cd i3-gaps
# mkdir -p build && cd build
# meson ..
# ninja
# meson install

# Build i3blocks from source
cd && git clone https://github.com/vivien/i3blocks
cd i3blocks
./autogen.sh
./configure
make
sudo make install

sudo apt install -y git wget
rm -fr ~/.config/i3blocks
git clone https://github.com/vivien/i3blocks-contrib ~/.config/i3blocks

# Install other tools
sudo apt install -y nitrogen xdotool dunst lm-sensors sysstat acpi playerctl rofi compton 

# Download and install font-awesome
sudo mkdir -p /usr/local/share/fonts/opentype/font-awesome
sudo wget https://git.io/JvHi9 -O '/usr/local/share/fonts/opentype/font-awesome/Font Awesome 5 Free-Solid-900.otf'

# Override config
mkdir -p ~/.config && cd ~/.config && rm -fr i3
git clone https://github.com/bokub/i3-config.git i3

# Override Regolith config
mkdir -p ~/.config/regolith2/i3
ln -sf ~/.config/i3/config ~/.config/regolith2/i3/config

# Download and set wallpaper
mkdir -p ~/wallpapers
wget https://git.io/Jv7wA -O ~/wallpapers/blue_pink_gradient.jpg
nitrogen --save --set-scaled ~/wallpapers/blue_pink_gradient.jpg --head=0 || echo -e "\e[33mCould not set wallpaper..."
sleep 0.5
nitrogen --save --set-scaled ~/wallpapers/blue_pink_gradient.jpg --head=1 || echo -e "\e[33mCould not set wallpaper..."

# Install zsh
sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Starship
cd && wget https://starship.rs/install.sh -O install_starship.sh
sh install_starship.sh -y
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

# Install Google Chrome
sudo sh -c 'echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

# Install Sublime Text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install -y apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

# Install Node.js
curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -

sudo apt-get update
sudo apt-get install -y google-chrome-stable sublime-text nodejs build-essential

# Install rivalcfg
sudo apt-get install -y python3-pip python3-dev python3-setuptools libusb-1.0-0-dev libudev-dev
sudo pip3 install rivalcfg
sudo rivalcfg --update-udev

# Cleanup
cd && rm -fr i3-gaps i3blocks snazzy Font-Awesome

echo -e "\e[32mSuccess !"
