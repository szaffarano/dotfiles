#!/usr/bin/env zsh

source ~/.zshrc

zathura_history="$HOME/.local/share/zathura/history"

rofiopts=(
  -dmenu
  -p "Select PDF"
  -i
  -markup-rows
  -lines 10
  -bw 2
  -yoffset 2
)

files=()

cat $zathura_history | grep -Po '\[\K[^\]]*' | while read -r pdf; do
  if [ -f $pdf ]; then
    files+=$pdf
  fi
done

selected=$(print -l $files | rofi ${rofiopts[@]})

# exit if nothing is selected
[[ -z $selected ]] && exit

zathura "$selected"

exit 0
