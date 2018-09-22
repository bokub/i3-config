# i3-config

> A backup of my [i3wm](https://i3wm.org/) config.

All these files should be placed in `~/.config/i3`

![System info](https://i.imgur.com/DMZyDQ1.png)

![Terminal](https://i.imgur.com/6EvkVhF.png)

![Workspaces](https://i.imgur.com/D8fTUBR.png)

![Status bar](https://i.imgur.com/OkbKEpt.png)

![Launcher](https://i.imgur.com/ahM3xgL.png)

<details>
<summary>
	Click to see the full screenshots
</summary>
	
![Screenshot](https://i.imgur.com/1mkvCdf.png)

![Screenshot](https://i.imgur.com/YXWsQTR.png)

</details>


## Dependencies

- [i3-gaps](https://github.com/Airblader/i3) (a fork of i3)
- [i3blocks](https://github.com/vivien/i3blocks) (status bar)
- [Rofi](https://github.com/DaveDavenport/rofi) (app launcher)
- [Compton](https://github.com/chjj/compton) (shadows & opacity)
- [Font Awesome](http://fontawesome.io/) (icons)


## Terminal color theme

[Dracula theme](http://mayccoll.github.io/Gogh/) for `gnome-terminal`


## UI theme

[Arc Theme](https://github.com/horst3180/arc-theme) with Arc-Darker variant


## Prompt PS1

```bash
PROMPT_COMMAND=__prompt_command # Func to gen PS1 after CMDs

__prompt_command() {
    local EXIT="$?" # This needs to be first
    PS1=""
    local RCol='\[\e[0m\]'
    local Red='\[\e[1;31m\]'
    local Gre='\[\e[1;32m\]'
    local Yel='\[\e[0;33m\]'
    local Blu='\[\e[0;34m\]'
    local Pin='\[\e[0;36m\]'

    PS1+="${Blu}\w " # Path

    _BRANCH=$(git branch 2>/dev/null | grep '^*' | colrm 1 2) # Git branch
    if [ -n "$_BRANCH" ]; then
    	PS1+="${Pin}"
    	# Yellow color if dirty
    	[[ $(git diff --shortstat 2> /dev/null | tail -n1) != "" ]] && PS1+="${Yel}"
    	PS1+="$_BRANCH "
	fi

    if [ $EXIT != 0 ]; then # Color depending on status
        PS1+="${Red}>"
    else
        PS1+="${Gre}>"
    fi
    PS1+=" ${RCol}" # Reset color
}

```
