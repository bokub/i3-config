#!/usr/bin/env bash
set -e

# curl -fsSL https://raw.githubusercontent.com/bokub/i3-config/master/quick-install.sh | bash

sudo apt update

# Install i3-gaps dependencies
sudo apt install -y libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev \
libxcb-util0-dev libxcb-icccm4-dev libyajl-dev \
libstartup-notification0-dev libxcb-randr0-dev \
libev-dev libxcb-cursor-dev libxcb-xinerama0-dev \
libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev \
autoconf libxcb-xrm0 libxcb-xrm-dev automake libxcb-shape0-dev

# Build i3-gaps from source
cd && git clone https://www.github.com/Airblader/i3 i3-gaps && cd i3-gaps
autoreconf --force --install
rm -rf build/ && mkdir -p build && cd build/
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make && sudo make install

# Install other tools
sudo apt install -y i3blocks rofi compton nitrogen xdotool dunst

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
cd
wget https://github.com/starship/starship/releases/latest/download/starship-x86_64-unknown-linux-gnu.tar.gz
sudo tar -xzf starship-x86_64-unknown-linux-gnu.tar.gz -C /usr/local/bin
rm starship-x86_64-unknown-linux-gnu.tar.gz
echo 'eval "$(starship init bash)"' >> .bashrc

curl -fsSL https://starship.rs/install.sh | bash -f

# Install Snazzy theme for gnome-terminal
cd && git clone https://github.com/tobark/hyper-snazzy-gnome-terminal.git snazzy && cd snazzy
chmod +x hyper-snazzy.sh && ./hyper-snazzy.sh

# Cleanup
cd && rm -fr i3-gaps snazzy Font-Awesome