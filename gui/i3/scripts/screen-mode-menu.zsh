#!/usr/bin/env zsh

source ~/.exports.zsh

rofi_opts=(
   -dmenu
   -p "Display"
   -i
   -markup-rows
   -lines 10
   -bw 2 
   -yoffset 2 
)

declare -A display_modes_opts

display_modes_opts["Dell U27 - Laptop Mirror"]="autorandr DELL_U2721DE-LAPTOP-MIRROR"
display_modes_opts["Dell U27 -> Dell Laptop"]="autorandr DELL_U2721DE-LAPTOP"
display_modes_opts["Dell U27"]="autorandr DELL_U2721DE"
display_modes_opts["Dell U27 HDMI"]="autorandr DELL_U2721DE_HDMI"
display_modes_opts["Dell Laptop"]="autorandr DELL_LAPTOP"
display_modes_opts["Dell Laptop Old"]="autorandr DELL_LAPTOP_OLD"

list=$(print -l ${(k)display_modes_opts} | sed s'/\"//g')
action=$(echo $list | rofi ${rofi_opts[@]})

# exit if nothing is selected
[[ -z $action ]] && exit

eval $display_modes_opts["$action"]

exit 0

