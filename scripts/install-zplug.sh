#!/bin/bash

ZPLUG_HOME=$HOME/.zplug

if [ -e "$ZPLUG_HOME" ]; then
	cd "$ZPLUG_HOME" && git pull
else
	git clone https://github.com/zplug/zplug "$ZPLUG_HOME"
fi
