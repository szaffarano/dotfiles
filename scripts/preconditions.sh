#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    echo "linux"

    [ -e $HOME/.ssh/local ] || mkdir -p $HOME/.ssh/local

    # neovim ppa
    $(grep neovim /etc/apt/sources.list.d/* >/dev/null 2>&1) \
        || sudo add-apt-repository ppa:neovim-ppa/stable -y

    # uninstall legacy nodejs
    ! $(dpkg -l | grep nodejs > /dev/null 2>&1) \
        || (sudo apt-get purge nodejs -y && sudo apt-get autoremove --purge -y)

elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "darwin"
else
    echo >&2 "Unsupported OS"
    exit 1
fi
