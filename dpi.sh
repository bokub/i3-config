#!/usr/bin/env bash

process_arguments() {
    if [ $# -eq 0 ]; then
        echo "No arguments provided. First argument should be 'high' or 'low'"
        exit 1
    fi
    while [ -n "$1" ]
    do
        case $1 in
            high) hidpi; shift; break;;
            low) lowdpi; shift; break;;
            *) echo "First argument should be 'high' or 'low'"; exit 1;;
        esac
    done
}

hidpi() {
    echo "Xft.dpi: 125 # High
# Xft.dpi: 96 # Low" > ~/.Xresources

    sed -i '/GDK_DPI_SCALE/d' ~/.profile
    echo "export GDK_DPI_SCALE=1.25 # High" >> ~/.profile
    echo "# export GDK_DPI_SCALE=1 # Low" >> ~/.profile
}

lowdpi() {
    echo "Xft.dpi: 96 # Low
# Xft.dpi: 125 # High" > ~/.Xresources

    sed -i '/GDK_DPI_SCALE/d' ~/.profile
    echo "export GDK_DPI_SCALE=1 # Low" >> ~/.profile
    echo "# export GDK_DPI_SCALE=1.25 # High" >> ~/.profile
}

process_arguments "$@"
