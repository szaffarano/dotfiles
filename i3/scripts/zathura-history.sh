#!/usr/bin/env bash

options='-columns 6 -width 100 -lines 15 -bw 2 -yoffset -2 -location 1'

selected=$(\
        cat ~/.local/share/zathura/history | grep -Po '\[\K[^\]]*' \
        | rofi -dmenu -i -markup-rows \
        "$options"
        )

# exit if nothing is selected
[[ -z $selected ]] && exit

zathura "$selected"

exit 0
