#!/bin/zsh

source $(dirname $(readlink -f $0))/asdf-utils.sh

installOrUpdateAsdfPlugin kotlin

installAsdfPackage kotlin latest
