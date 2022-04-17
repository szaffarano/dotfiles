#!/usr/bin/env zsh

NCSPOT_BIN="$HOME/.asdf/shims/ncspot"

pkill ncspot
pgrep ncspot || kitty --title ncspot_scratchpad -e "$NCSPOT_BIN"
