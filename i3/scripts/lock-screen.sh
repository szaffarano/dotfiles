#!/usr/bin/env bash

IMG="$HOME/.cache/locked.png"

# Take a screenshot
scrot "$IMG"

# Pixellate it 10x
mogrify -scale 10% -scale 1000% "$IMG"

# Lock screen displaying this image.
i3lock -i "$IMG"
