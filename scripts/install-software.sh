#!/bin/bash

APT_PKGS=
PIP_PKGS=

function addAptIfNotInstalled {
  if ! $(dpkg -l $1 2>/dev/null 1>&2); then
    APT_PKGS="$APT_PKGS $1"
  fi
}

function addPipIfNotInstalled {
  if [ $(pip list 2>/dev/null | grep $1 | wc -l) -eq 0 ]; then
    PIP_PKGS="$PIP_PKGS $1"
  fi
}

addAptIfNotInstalled "taskwarrior"
addAptIfNotInstalled "vim"
addAptIfNotInstalled "git"
addAptIfNotInstalled "exuberant-ctags"
addAptIfNotInstalled "texlive-xetex"

if [ -n "$APT_PKGS" ]; then
  sudo apt-get update && \
    sudo apt-get install -y ${APT_PKGS}
fi

# anaconda
export PATH="$PATH:/home/sebas/.local/anaconda3/bin"
if ! $(which conda 2> /dev/null 1>&2); then
  echo "Installing miniconda"
  curl -LO https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    chmod 775 ./Miniconda3-latest-Linux-x86_64.sh && \
    ./Miniconda3-latest-Linux-x86_64.sh -b -p /home/sebas/.local/anaconda3
  trap "{ rm -f ./Miniconda3-latest-Linux-x86_64.sh; }" EXIT
fi

addPipIfNotInstalled "tasklib"

if [ -n "$PIP_PKGS" ]; then
  pip install $PIP_PKGS
fi
