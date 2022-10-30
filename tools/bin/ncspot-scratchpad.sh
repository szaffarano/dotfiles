#!/usr/bin/env zsh

NCSPOT_BIN="$HOME/.cargo/bin/ncspot"

pkill ncspot
pgrep ncspot || kitty --title ncspot_scratchpad -e "$NCSPOT_BIN"
