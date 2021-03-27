#!/usr/bin/env bash

i3-msg focus parent, title_format `zenity --title="i3-msg title_format" --text "Enter a title" --entry`, focus child
