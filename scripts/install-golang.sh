#!/bin/zsh

source $(dirname $(readlink -f $0))/asdf-utils.sh

installOrUpdateAsdfPlugin golang

installAsdfPackage golang latest
