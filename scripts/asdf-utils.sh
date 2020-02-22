#!/bin/bash

# shellcheck disable=SC1090
source "$HOME"/.asdf/asdf.sh

if ! command asdf 2> /dev/null 1>&2; then
    echo "asdf not found!"
    exit 1
fi

function installOrUpdateAsdfPlugin {
    asdf plugin-add "$1" || asdf plugin-update "$1"
}

function installAsdfPackage {
    PKG="$1"
    VERSION="$2"

    echo "Installing $PKG:$VERSION"
    asdf install "$PKG" "$VERSION"

    if [ "$VERSION" = "latest" ]; then
        VERSION="$(asdf list "$PKG" | tail -n 1 | tr -d ' ')"
        echo "Updating global $PKG:$VERSION"
        asdf global "$PKG" "$VERSION"
    else
        asdf global "$PKG" "$VERSION"
    fi
}
