#!/bin/bash

FZF_SRC=$HOME/.fzf

if [ -e "$FZF_SRC" ]; then
	cd "$FZF_SRC" && git pull
else	
	git clone --depth 1 https://github.com/junegunn/fzf.git "$FZF_SRC"
	cd "$FZF_SRC" || exit
fi

"$FZF_SRC"/install --all
