#!/bin/bash

declare -A PACKAGES
PACKAGES[neovim]="app-editors/neovim"
PACKAGES[git]="dev-vcs/git"
PACKAGES[exuberant-ctags]="dev-util/ctags"
PACKAGES[texlive-xetex]="dev-texlive/texlive-xetex"
PACKAGES[libxml2-utils]="dev-libs/libxml2"
PACKAGES[jq]="app-misc/jq"
PACKAGES[fontconfig]="media-libs/fontconfig"
PACKAGES[fonts-powerline]="media-fonts/powerline-symbols"
PACKAGES[zip]="app-arch/zip"
PACKAGES[curl]="curl"
PACKAGES[silversearcher-ag]="sys-apps/the_silver_searcher"
PACKAGES[google-chrome-stable]="google-chrome-stable"
PACKAGES[python3-distutils]="python3-distutils"
PACKAGES[htop]="htop"
PACKAGES[secure-delete]="secure-delete"
PACKAGES[net-tools]="net-tools"
PACKAGES[speedcrunch]="speedcrunch"
PACKAGES[rar]="rar"
PACKAGES[unrar]="unrar"
PACKAGES[git-flow]="git-flow"
PACKAGES[fonts-powerline]="fonts-powerline"
PACKAGES[git-secret]="git-secret"
PACKAGES[youtube-dl]="youtube-dl"
PACKAGES[sysstat]="sysstat"

PKGS=

if command -v emerge; then
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
    if dpkg -l "$pkg"  2>/dev/null 1>&2; then
      found=1
    fi
  fi
  echo $pkg: $found
  if [ ${found} -eq 0 ]; then
    PKGS="${PKGS} ${pkg}"
  fi
}

for i in "${!PACKAGES[@]}"
do
    addIfNotInstalled $i
done

if [ -n "$PKGS" ]; then
  if [ ${IS_GENTOO} -eq 1 ]; then
    sudo emerge --sync && \
      sudo emerge "${PKGS}"
  else
    sudo apt-get update && \
      sudo apt-get install -y "${PKGS}"
  fi
fi

