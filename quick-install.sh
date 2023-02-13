#!/usr/bin/env bash

# Usage:
# curl -fsSL https://raw.githubusercontent.com/bokub/i3-config/master/quick-install.sh | bash

sudo apt update

# Just in case
sudo apt install -y git wget autoconf vim curl

# Install Regolith
wget -qO - https://regolith-desktop.org/regolith.key | \
gpg --dearmor | sudo tee /usr/share/keyrings/regolith-archive-keyring.gpg > /dev/null
echo deb "[arch=amd64 signed-by=/usr/share/keyrings/regolith-archive-keyring.gpg] \
https://regolith-desktop.org/release-ubuntu-jammy-amd64 jammy main" | \
sudo tee /etc/apt/sources.list.d/regolith.list
sudo apt update
sudo apt install -y regolith-desktop
sudo apt upgrade

# Uninstall unwanted Regolith packages
sudo apt remove -y \
regolith-rofication \
regolith-i3-navigation \
regolith-i3-resize \
regolith-i3-workspace-config \
regolith-i3-resize \
regolith-i3-session \
regolith-i3-base-launchers \
regolith-i3-i3xrocks \
regolith-i3-networkmanager \
regolith-i3-user-programs \
regolith-i3-unclutter \
regolith-i3-next-workspace \
regolith-i3-compositor \
regolith-i3-default-style \
regolith-i3-ilia \
regolith-i3-ftue \
regolith-i3-swap-focus \
regolith-i3-control-center-regolith \
regolith-i3-gaps-partial

# Install additional dependencies
sudo apt install -y \
regolith-look-dracula \
regolith-compositor-picom-glx \
dunst \
acpi \
lm-sensors \
playerctl
:
sudo add-apt-repository -y ppa:peek-developers/stable
sudo apt update
sudo apt install -y peek

# Build and install dunst from source
sudo apt-get install -y libdbus-1-dev libx11-dev libxinerama-dev libxrandr-dev libxss-dev libglib2.0-dev libpango1.0-dev libgtk-3-dev libxdg-basedir-dev libnotify-dev
cd && git clone https://github.com/dunst-project/dunst.git
cd dunst
make
sudo make install
cd .. && rm -fr dunst

# Clone config
cd && git clone https://github.com/bokub/i3-config.git .i3-config

# Clone i3blocks scripts
git clone https://github.com/vivien/i3blocks-contrib ~/.config/i3blocks

# Create symlinks
mkdir -p ~/.config/regolith2/i3
ln -s ~/.i3-config/i3 ~/.config/regolith2/i3/config.d
mkdir -p ~/.config/regolith2/i3xrocks
ln -s ~/.i3-config/bar ~/.config/regolith2/i3xrocks/conf.d
mkdir -p ~/.config/dunst
ln -s ~/.i3-config/dunstrc ~/.config/dunst/dunstrc
rm -f ~/.config/regolith2/Xresources && ln -s ~/.i3-config/Xresources ~/.config/regolith2/Xresources

# Download and install font-awesome
sudo mkdir -p /usr/local/share/fonts/opentype/font-awesome
sudo wget "https://github.com/duyplus/fontawesome-pro/blob/master/otfs/Font%20Awesome%206%20Pro-Solid-900.otf?raw=true" -O '/usr/local/share/fonts/opentype/font-awesome/Font Awesome 6 Pro-Solid-900.otf'

# Download and install Jetbrains Mono
sudo mkdir -p /usr/local/share/fonts/JetBrainsMono
cd && wget https://download.jetbrains.com/fonts/JetBrainsMono-2.242.zip
sudo unzip JetBrainsMono-2.242.zip -d /usr/local/share/fonts/JetBrainsMono
rm -f JetBrainsMono-2.242.zip
fc-cache -f -v

# Download and set wallpaper
mkdir -p ~/wallpapers
wget https://git.io/Jv7wA -O ~/wallpapers/blue_pink_gradient.jpg
echo "regolith.wallpaper.file: ~/wallpapers/blue_pink_gradient.jpg" >> ~/.config/regolith2/Xresources

# Install flameshot
sudo apt install -y flameshot
mkdir ~/Screenshots

# Install Google Chrome
sudo sh -c 'echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo apt-get install -y google-chrome-stable

# Install Sublime Text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install -y apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get install -y sublime-text

# Install Node.js
curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash - && sudo apt-get install -y nodejs
sudo apt-get install -y build-essential

# Install rivalcfg
sudo apt-get install -y python3-pip python3-dev python3-setuptools libusb-1.0-0-dev libudev-dev
sudo pip3 install rivalcfg
sudo rivalcfg --update-udev

# Install zsh
sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Starship
cd && wget https://starship.rs/install.sh -O install_starship.sh
sh install_starship.sh -y
echo 'eval "$(starship init bash)"' >> .bashrc
echo 'eval "$(starship init zsh)"' >> .zshrc
rm install_starship.sh

echo -e "\e[32mSuccess !"
