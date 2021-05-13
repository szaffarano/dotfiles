#!/usr/bin/env zsh

rofi_opts=(
   -dmenu
   -p "Power option"
   -i
   -markup-rows
   -lines 10
   -bw 2 
   -yoffset 2 
)

declare -A power_opts
power_opts["Lock the screen"]="$HOME/.config/i3/scripts/lock-screen.sh"
power_opts["Power off"]="systemctl poweroff"
power_opts["Reboot"]="systemctl reboot"
power_opts["Logout"]="i3-msg exit"
power_opts["Hibernate"]="systemctl hibernate"
power_opts["Suspend"]="systemctl suspend"

list=$(print -l ${(k)power_opts} | sed s'/\"//g')
action=$(echo $list | rofi ${rofi_opts[@]})

# exit if nothing is selected
[[ -z $action ]] && exit

eval $power_opts["$action"]

exit 0
