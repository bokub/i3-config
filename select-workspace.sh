#!/bin/bash

gen_workspaces()
{
    i3-msg -t get_workspaces | tr ',' '\n' | grep "name" | sed 's/"name":"\(.*\)"/\1/g' | sort -n
}


WORKSPACE=$( (gen_workspaces)  | rofi -dmenu -config ~/.config/i3/rofi -lines 10 -font 'FontAwesome 12' -p "Select workspace:")

if [ -n "${WORKSPACE}" ]
then
    i3-msg workspace "${WORKSPACE}"
fi