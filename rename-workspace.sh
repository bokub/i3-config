#!/bin/bash
OLD=$(i3-msg -t 'get_workspaces' | sed -e 's/{"num/\n{"num/g' | grep \"focused\":true | sed -e 's/,"/\n/g' | grep name | cut -d\" -f 3)
NEW=$(zenity --text="Enter new name:" --entry --title="Rename workspace $OLD" --entry-text="$OLD : ")
echo "rename workspace \"$OLD\" to \"$NEW\""
i3-msg "rename workspace \"$OLD\" to \"$NEW\""