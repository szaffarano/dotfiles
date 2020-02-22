#!/bin/zsh

source $(dirname $(readlink -f $0))/asdf-utils.sh

installOrUpdateAsdfPlugin nodejs \
    && bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring

installAsdfPackage nodejs latest

npm install -g yarn
