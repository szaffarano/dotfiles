#!/usr/bin/env zsh

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

display_modes_opts["Mirror"]="autorandr mirror"
display_modes_opts["Primary Screen Only"]="autorandr mon-only"
display_modes_opts["Laptop Screen Only"]="autorandr lap-only"
display_modes_opts["Primary Screen (*) -> Laptop Screen"]="autorandr pri_sm-mon-lap"
display_modes_opts["Primary Screen -> *Laptop Screen"]="autorandr mon-pri_lap"
display_modes_opts["*Laptop Screen -> Primary Screen"]="autorandr pri_lap-mon"
display_modes_opts["Laptop Screen-> Primary Screen(*)"]="autorandr lap-pri_mon"

list=$(print -l ${(k)display_modes_opts} | sed s'/\"//g')
action=$(echo $list | rofi ${rofi_opts[@]})

# exit if nothing is selected
[[ -z $action ]] && exit

eval $display_modes_opts["$action"]

exit 0
