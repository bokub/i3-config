# i3-config

> A backup of my [i3wm](https://i3wm.org/) config.

All these files should be placed in `~/.config/i3`

<p align="center">
  <img alt="System" src="https://raw.githubusercontent.com/bokub/i3-config/images/screenshots/system.png">
  <img alt="Files" src="https://raw.githubusercontent.com/bokub/i3-config/images/screenshots/files.png">
  <img alt="Tiles" src="https://raw.githubusercontent.com/bokub/i3-config/images/screenshots/tiles.png">
</p>

## Dependencies

- [i3-gaps](https://github.com/Airblader/i3) (a fork of i3)
- [i3blocks](https://github.com/vivien/i3blocks) (status bar)
- [Rofi](https://github.com/DaveDavenport/rofi) (app launcher)
- [Compton](https://github.com/chjj/compton) (shadows & opacity)
- [Dunst](https://github.com/dunst-project/dunst) (notification daemon)
- [Font Awesome](http://fontawesome.io/) (icons)
- [Nitrogen](https://github.com/l3ib/nitrogen/) (wallpaper manager)
- [Starship](https://github.com/starship/starship) (shell prompt)
- [Snazzy](https://github.com/tobark/hyper-snazzy-gnome-terminal) (terminal color scheme)

## Quick install

```sh
# Install everything on a fresh Ubuntu setup
curl -fsSL https://git.io/i3-config | bash
```

The command above will:

- Install i3-gaps dependencies and build i3-gaps from source
- Install i3blocks, Rofi, Compton, Dunst and Nitrogen
- Download and install Font Awesome fonts
- Override i3 config with this repository
- Download and set the wallpaper
- Install Starship
- Install Snazzy color scheme for gnome-terminal

The script should work on a fresh Ubuntu setup. For any other distro, I have no idea.

