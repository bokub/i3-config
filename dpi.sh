#!/usr/bin/env bash

#
# Quickly change HiDpi settings to 'high' or 'low'
# N.B: You may need to reboot to see the changes.
#  
# Usage:
# $ dpi.sh high|low
#

process_arguments() {
    if [ $# -eq 0 ]; then
        echo "Usage: dpi.sh 4k|high|low"
        exit 1
    fi
    while [ -n "$1" ]
    do
        case $1 in
            4k) 4kdpi; shift; break;;
            high) hidpi; shift; break;;
            low) lowdpi; shift; break;;
            *) echo "Usage: dpi.sh 4k|high|low"; exit 1;;
        esac
    done
}

4kdpi() {
    # Write Xft.dpi in .Xresources
    echo -e "Xft.dpi: 150" > ~/.Xresources

    # Replace GDK_DPI_SCALE in .profile
    sed -i '/GDK_DPI_SCALE/d' ~/.profile
    echo -e "export GDK_DPI_SCALE=1.5" >> ~/.profile
}

hidpi() {
    # Write Xft.dpi in .Xresources
    echo -e "Xft.dpi: 125" > ~/.Xresources

    # Replace GDK_DPI_SCALE in .profile
    sed -i '/GDK_DPI_SCALE/d' ~/.profile
    echo -e "export GDK_DPI_SCALE=1.25 # High" >> ~/.profile
}

lowdpi() {
    # Write Xft.dpi in .Xresources
    echo -e "Xft.dpi: 96" > ~/.Xresources

    # Replace GDK_DPI_SCALE in .profile
    sed -i '/GDK_DPI_SCALE/d' ~/.profile
    echo -e "export GDK_DPI_SCALE=1 # Low" >> ~/.profile
}

process_arguments "$@"
