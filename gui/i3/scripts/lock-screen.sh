#!/usr/bin/env bash

BASE="$HOME/.cache/lock"
IMG="$BASE/locked.png"

[[ -e "$BASE" ]] || mkdir -p "$BASE"
[[ -e "$IMG" ]] && rm "$IMG"

# Take a screenshot
scrot "$IMG"

# Pixellate it 10x
mogrify -scale 10% -scale 1000% "$IMG"

# Lock screen displaying this image.
i3lock -i "$IMG"
