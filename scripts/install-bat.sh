#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu" ]]; then
	
	BAT_VERSION=$(bat --version 2>/dev/null || echo UNKNONW)

	DEB=$(curl -s https://api.github.com/repos/sharkdp/bat/releases/latest | \
		grep  "browser_download_url.*deb" | \
		cut -d: -f2,3 | \
		grep amd64 | \
		grep -v musl | \
		head -n 1 |
		sed -e s'/\"//g' -e s'/\s//g')

	if ! (command -v bat > /dev/null && echo "$DEB" | \
		grep "${BAT_VERSION/\ /_}" > /dev/null)
	then
		TEMP_FILE=/tmp/bat.deb

		curl -sL "$DEB" -o "$TEMP_FILE" && \
			sudo dpkg -i "$TEMP_FILE" && \
			rm "$TEMP_FILE"
	fi

elif [[ "$OSTYPE" == "darwin"* ]]; then
	brew install bat
else
    echo >&2 "Unsupported OS"
    exit 1
fi
