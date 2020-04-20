#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu" ]]; then
	# shellcheck disable=SC1090
	source "$(dirname "$(readlink -f "$0")")/asdf-utils.sh"

	installOrUpdateAsdfPlugin shellcheck 

	installAsdfPackage shellcheck latest
elif [[ "$OSTYPE" == "darwin"* ]]; then
	brew install shellcheck
else
    echo >&2 "Unsupported OS"
    exit 1
fi
