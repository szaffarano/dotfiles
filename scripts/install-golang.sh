#!/bin/zsh

source $HOME/.asdf/asdf.sh

. ~/.dotfiles/zsh/sdkman.sh

if ! $(which asdf 2> /dev/null 1>&2); then
	echo "asdf not found!"
	exit 1
fi

asdf plugin-add golang

asdf install golang latest

asdf global golang $(asdf list golang | tail -n 1)
