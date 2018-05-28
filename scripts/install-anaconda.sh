#!/bin/bash

PIP_PKGS=
function addPipIfNotInstalled {
  if [ $(pip list 2>/dev/null | grep $1 | wc -l) -eq 0 ]; then
    PIP_PKGS="$PIP_PKGS $1"
  fi
}

export PATH="/home/sebas/.local/anaconda3/bin:$PATH"
if ! $(which conda 2> /dev/null 1>&2); then
  echo "Installing miniconda"
  curl -LO https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    chmod 775 ./Miniconda3-latest-Linux-x86_64.sh && \
    ./Miniconda3-latest-Linux-x86_64.sh -b -p /home/sebas/.local/anaconda3
  trap "{ rm -f ./Miniconda3-latest-Linux-x86_64.sh; }" EXIT
fi

echo "Pip: $(which pip)"
addPipIfNotInstalled "tasklib"
addPipIfNotInstalled "proselint"
addPipIfNotInstalled "black"
addPipIfNotInstalled "flake8"

if [ -n "$PIP_PKGS" ]; then
  echo "installing packages $PIP_PKGS"
  pip install $PIP_PKGS
fi
