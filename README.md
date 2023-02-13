# i3-config

> A backup of my [i3wm](https://i3wm.org/) config.

<p align="center">
  <img alt="Terminal" src="https://user-images.githubusercontent.com/17952318/218422401-8b36efd8-f0c0-4ac7-b172-7f474c554bad.png">
  <img alt="Neofetch" src="https://user-images.githubusercontent.com/17952318/218422393-94970dee-bca6-4df3-8eb7-70b872e92b74.png">
  <img alt="Browser" src="https://user-images.githubusercontent.com/17952318/218422399-a0064ce2-11cc-4b8d-9641-ce5067aabef1.png">
</p>

## Introduction

**N.B**: During a few years, I used to build i3-gaps from source, and install all multiple dependencies separately.

The installation script was very complicated and always broken.

I've now switched to [Regolith](https://regolith-desktop.com/), which integrates very well with Ubuntu, and is easier to insall.

This repository can be cloned anywhere you want, but you'll have to symlink each one of these to the right place:

| Source | Destination |
|---|---|
| i3 | ~/.config/regolith2/i3/config.d |
| bar | ~/.config/regolith2/i3rocks/conf.d |
| dunstrc | ~/.config/dunst/dunstrc |
| Xresources | ~/.config/regolith2/Xresources |

## Dependencies

- [Regolith](https://regolith-desktop.com) (i3 for Ubuntu & Gnome)
- [Dunst](https://github.com/dunst-project/dunst) (notification daemon)
- [Font Awesome](https://fontawesome.com) (icons)
- [Starship](https://github.com/starship/starship) (shell prompt)

## Quick install

```sh
# Install everything on a fresh Ubuntu setup
curl -fsSL https://git.io/i3-config | bash
```

The command above will:

- Install Regolith Desktop and some sub-dependencies
- Remove all default Regolith settings
- Build and install dunst from source
- Clone this repository in `~/.i3-config` and create symlinks
- Install i3blocks scripts
- Download and install fonts & wallpaper
- Install zsh, Starship, Google Chrome, Sublime Text, Node.js, rivalcfg, Flameshot

The script should work on a fresh Ubuntu 22.04 setup. For any other distro, I'm almost sure it won't work.

## Using on a HiDPI display

You can set scale and DPI value like this:

```bash
# i3
echo "Xft.dpi: 125" >> ~/.Xresources

# Other apps (Chrome, Nautilus, Terminal...)
echo "export GDK_DPI_SCALE=1.25" >> ~/.profile
```

Or just use the `dpi.sh` script from this repo:

```bash
~/.config/i3/dpi.sh high # On HiDpi display

~/.config/i3/dpi.sh low # On regular display

sudo reboot
```
