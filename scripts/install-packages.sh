#!/bin/bash

declare -A PACKAGES
PACKAGES[taskwarrior]="app-misc/task"
PACKAGES[vim]="app-editors/vim"
PACKAGES[git]="dev-vcs/git"
PACKAGES[universal-ctags]="dev-util/ctags"
PACKAGES[texlive-xetex]="dev-texlive/texlive-xetex"
PACKAGES[libxml2-utils]="dev-libs/libxml2"
PACKAGES[jq]="app-misc/jq"
PACKAGES[fontconfig]="media-libs/fontconfig"
PACKAGES[fonts-powerline]="media-fonts/powerline-symbols"
PACKAGES[zip]="app-arch/zip"
PACKAGES[silversearcher-ag]="sys-apps/the_silver_searcher"

PKGS=

if [ $(which emerge) ]; then
  IS_GENTOO=1
else
  IS_GENTOO=0
fi

function addIfNotInstalled {
  found=0
  if [ $IS_GENTOO -eq 1 ]; then
    pkg=${PACKAGES[$1]}
    grep "${pkg}" /var/lib/portage/world > /dev/null && found=1
  else
    pkg=$1
    if [ $(dpkg -l $1 2>/dev/null 1>&2) ]; then
      found=1
    fi
  fi
  if [ ${found} -eq 0 ]; then
    PKGS="${PKGS} ${pkg}"
  fi
}

addIfNotInstalled "taskwarrior"
addIfNotInstalled "vim"
addIfNotInstalled "git"
addIfNotInstalled "universal-ctags"
addIfNotInstalled "texlive-xetex"
addIfNotInstalled "libxml2-utils"
addIfNotInstalled "jq"
addIfNotInstalled "fontconfig"
addIfNotInstalled "fonts-powerline"
addIfNotInstalled "zip"
addIfNotInstalled "silversearcher-ag"

if [ -n "$PKGS" ]; then
  if [ ${IS_GENTOO} -eq 1 ]; then
    sudo emerge --sync && \
      sudo emerge ${PKGS}
  else
    sudo apt-get update && \
      sudo apt-get install -y ${PKGS}
  fi
fi

