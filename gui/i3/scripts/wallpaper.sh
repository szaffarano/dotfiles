#!/usr/bin/env bash

BASE="$HOME/Pictures/Wallpapers"

if ! [[ -e "$BASE" ]]; then
	echo "Warning! $BASE not found"
	xsetroot -gray
	exit
fi

PICTURE=$(find "$BASE" -type f | sort -R | head -n 1)

feh --no-fehbg --bg-fill "$PICTURE"
