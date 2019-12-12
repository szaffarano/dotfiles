#!/bin/zsh

source $HOME/.asdf/asdf.sh

. ~/.dotfiles/zsh/sdkman.sh

if ! $(which asdf 2> /dev/null 1>&2); then
	echo "asdf not found!"
	exit 1
fi

asdf plugin-add nodejs \
    && bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring

asdf install nodejs latest

asdf global nodejs $(asdf list nodejs | tail -n 1)
