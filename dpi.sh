#!/usr/bin/env bash

#
# Quickly change HiDpi settings to 'high' or 'low'
# N.B: You need to log out and log in again to see the changes.
#  
# Usage:
# $ dpi.sh high|low
#

process_arguments() {
    if [ $# -eq 0 ]; then
        echo "Usage: dpi.sh high|low"
        exit 1
    fi
    while [ -n "$1" ]
    do
        case $1 in
            high) hidpi; shift; break;;
            low) lowdpi; shift; break;;
            *) echo "Usage: dpi.sh high|low"; exit 1;;
        esac
    done
}

hidpi() {
    # Write Xft.dpi in .Xresources
    echo -e "Xft.dpi: 125 # High\n# Xft.dpi: 96 # Low" > ~/.Xresources

    # Replace GDK_DPI_SCALE in .profile
    sed -i '/GDK_DPI_SCALE/d' ~/.profile
    echo -e "export GDK_DPI_SCALE=1.25 # High\n# export GDK_DPI_SCALE=1 # Low" >> ~/.profile
}

lowdpi() {
    # Write Xft.dpi in .Xresources
    echo -e "Xft.dpi: 96 # Low\n# Xft.dpi: 125 # High" > ~/.Xresources

    # Replace GDK_DPI_SCALE in .profile
    sed -i '/GDK_DPI_SCALE/d' ~/.profile
    echo -e "export GDK_DPI_SCALE=1 # Low\n# export GDK_DPI_SCALE=1.25 # High" >> ~/.profile
}

process_arguments "$@"
