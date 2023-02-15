# i3-config

> My [i3wm](https://i3wm.org/) configuration files.

## Introduction

I've been a [i3wm](https://i3wm.org/) user since 2016, but my workflow, habits, and configuration never stopped evolving.

Instead of re-configuring all my setup manually everytime I use a new computer, I use this repository to setup everything with a single command.

I also use it as a backup so I can always revert my configuration in case of mistakes.

<p align="center">
  <img alt="Terminal" src="https://user-images.githubusercontent.com/17952318/218422401-8b36efd8-f0c0-4ac7-b172-7f474c554bad.png">
  <img alt="Neofetch" src="https://user-images.githubusercontent.com/17952318/218422393-94970dee-bca6-4df3-8eb7-70b872e92b74.png">
  <img alt="Browser" src="https://user-images.githubusercontent.com/17952318/218422399-a0064ce2-11cc-4b8d-9641-ce5067aabef1.png">
</p>

## Setup

This repository contains all the configuration files for the different tools I use daily.

It can be cloned anywhere you want, but you'll have to symlink each one of these to the right place:

| Source | Destination |
|---|---|
| `i3/` | `~/.config/regolith2/i3/config.d` |
| `bar/` | `~/.config/regolith2/i3rocks/conf.d` |
| `dunstrc` | `~/.config/dunst/dunstrc` |
| `Xresources` | `~/.config/regolith2/Xresources` |

## Dependencies

- [Regolith](https://regolith-desktop.com) (i3 + gaps for Ubuntu & Gnome)
- [Dunst](https://github.com/dunst-project/dunst) (notification daemon)
- [Font Awesome](https://fontawesome.com) (icons)
- [Starship](https://github.com/starship/starship) (shell prompt)
- And more

## Quick install

```sh
# Install everything on a fresh Ubuntu 22.04 setup
curl -fsSL https://git.io/i3-config | bash
```

The command above will:

- Install Regolith Desktop and some sub-dependencies
- Remove all default Regolith settings
- Build and install dunst from source
- Clone this repository in `~/.i3-config` and create symlinks
- Install default i3blocks scripts
- Download and install fonts & wallpaper
- Install zsh, Starship, Google Chrome, Sublime Text, Node.js, rivalcfg, Flameshot...

The script should work on a fresh Ubuntu 22.04 setup. For any other distro, I'm almost sure it won't work.

## Other

<details><summary>Using on a HiDPI display</summary>

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
</details>

<details><summary>My git config</summary>
  
```bash
[alias]
	st = status -s
	pl = pull
	ps = "!git push --set-upstream origin $(git symbolic-ref --short HEAD)"
	psn = "!git push --no-verify --set-upstream origin $(git symbolic-ref --short HEAD)"
	psnf = "!git push --force --no-verify --set-upstream origin $(git symbolic-ref --short HEAD)"
	reflog = reflog --date=iso
	co = checkout
	undo = reset --soft HEAD^
	amend = commit --amend --no-edit
	lg = log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
	clean-branch = "!git fetch -p && for branch in $(git branch -vv | grep ': gone]' | awk '{print $1}'); do git branch -D $branch; done"

[core]
	excludesFile = ~/.gitignore
	editor = vim

[rebase]
	autoStash = true
```
</details>
