#!/bin/bash

export NVM_DIR="$HOME/.nvm"
if ! [ -d ${NVM_DIR} ]; then
  echo "Installing nvm..."
  git clone https://github.com/creationix/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

if ! $(which node 2> /dev/null 1>&2); then
  # install default nodejs
  echo "Installing default nodejs"
  nvm install node
fi

nvm use node

if ! $(which yarn 2> /dev/null 1>&2); then
  echo "Installing yarn"
  npm -g install yarn
fi

yarn global add prettier
yarn global add js-beautify
yarn global add eslint
