#!/usr/bin/env zsh

NCSPOT_BIN="$HOME/.asdf/shims/ncspot"

pkill ncspot
pgrep ncspot || alacritty -t ncspot_scratchpad -e "$NCSPOT_BIN"
