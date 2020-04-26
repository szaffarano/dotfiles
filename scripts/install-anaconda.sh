#!/bin/bash

PIP_PKGS=
function addPipIfNotInstalled {
  if [ "$(pip list 2>/dev/null | grep -c "$1")" -eq 0 ]; then
    PIP_PKGS="$PIP_PKGS $1"
  fi
}

export PATH="$HOME/.local/anaconda3/bin:$PATH"
if ! command -v conda 2> /dev/null 1>&2; then
  echo "Installing miniconda"
  curl -LO https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    chmod 775 ./Miniconda3-latest-Linux-x86_64.sh && \
    ./Miniconda3-latest-Linux-x86_64.sh -b -p "$HOME"/.local/anaconda3
  trap "{ rm -f ./Miniconda3-latest-Linux-x86_64.sh; }" EXIT
fi

echo "Pip: $(command -v pip)"
addPipIfNotInstalled "tasklib"
addPipIfNotInstalled "proselint"
addPipIfNotInstalled "black"
addPipIfNotInstalled "flake8"
addPipIfNotInstalled "vim-vint"
addPipIfNotInstalled "yamllint"
addPipIfNotInstalled "powerline-status"

if [ -n "$PIP_PKGS" ]; then
  echo "installing packages $PIP_PKGS"
  pip install "$PIP_PKGS"
fi
