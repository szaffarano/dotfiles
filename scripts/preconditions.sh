#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    echo "linux"

    mkdir -p $HOME/.ssh/local

    # neovim ppa
    sudo add-apt-repository ppa:neovim-ppa/stable -y

    # uninstall legacy nodejs
    sudo apt-get purge nodejs -y

elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "darwin"
else
    echo >&2 "Unsupported OS"
    exit 1
fi
