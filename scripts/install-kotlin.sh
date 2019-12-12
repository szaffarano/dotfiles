#!/bin/zsh

source $HOME/.asdf/asdf.sh

. ~/.dotfiles/zsh/sdkman.sh

if ! $(which asdf 2> /dev/null 1>&2); then
	echo "asdf not found!"
	exit 1
fi

asdf plugin-add kotlin

asdf install kotlin latest

asdf global kotlin $(asdf list kotlin | tail -n 1)
