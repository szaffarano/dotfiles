#!/usr/bin/env zsh

AUTORANDR="~/.asdf/shims/autorandr"

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


display_modes_opts["Dell U27 HDMI"]="$AUTORANDR DELL_U2721DE_HDMI"
display_modes_opts["Dell U27 HDMI Laptop Old"]="$AUTORANDR DELL_U2721DE_HDMI-LAPTOP_OLD"
display_modes_opts["ThinkVision 34 HDMI"]="$AUTORANDR THINK_34"
display_modes_opts["ThinkVision 34 HDMI Laptop"]="$AUTORANDR THINK_34_LAPTOP"

list=$(print -l ${(k)display_modes_opts} | sed s'/\"//g')
action=$(echo $list | rofi ${rofi_opts[@]})

# exit if nothing is selected
[[ -z $action ]] && exit

echo $display_modes_opts["$action"]
eval $display_modes_opts["$action"]

exit 0

