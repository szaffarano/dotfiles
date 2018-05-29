#!/bin/bash

APT_PKGS=
function addAptIfNotInstalled {
  if ! $(dpkg -l $1 2>/dev/null 1>&2); then
    APT_PKGS="$APT_PKGS $1"
  fi
}

addAptIfNotInstalled "taskwarrior"
addAptIfNotInstalled "vim"
addAptIfNotInstalled "git"
addAptIfNotInstalled "exuberant-ctags"
addAptIfNotInstalled "texlive-xetex"
addAptIfNotInstalled "libxml2-utils"
addAptIfNotInstalled "jq"
addAptIfNotInstalled "fontconfig"
addAptIfNotInstalled "fonts-powerline"

if [ -n "$APT_PKGS" ]; then
  sudo apt-get update && \
    sudo apt-get install -y ${APT_PKGS}
fi
