#!/bin/zsh

source $HOME/.asdf/asdf.sh

. ~/.dotfiles/zsh/sdkman.sh

if ! $(which asdf 2> /dev/null 1>&2); then
	echo "asdf not found!"
	exit 1
fi

asdf plugin-add scala
asdf plugin-add sbt

asdf install scala latest
asdf install sbt latest

asdf global scala $(asdf list scala | tail -n 1)
asdf global sbt $(asdf list sbt | tail -n 1)
