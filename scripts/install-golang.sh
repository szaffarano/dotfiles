#!/bin/bash

BASE_URL="https://dl.google.com/go/"
VERSION="$(curl https://golang.org/VERSION?m=text -q 2>/dev/null)"
ARCH="amd64"

if ! $(echo $(go version 2>/dev/null) | grep $VERSION 2>/dev/null 1>&2); then
    if [[ "$OSTYPE" == "linux-gnu" ]]; then
        OS="linux"
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        OS="darwin"
    else
        echo >&2 "Unable to install golang, nsupported OS"
        exit 1
    fi

    curl -L "$BASE_URL/$VERSION.$OS-$ARCH.tar.gz" -o /tmp/go.tar.gz \
        && rm -rf $HOME/.local/go \
        && tar -C $HOME/.local -xzf /tmp/go.tar.gz \
        && rm /tmp/go.tar.gz
else 
    echo "GoLang $VERSION already installed!"
fi
