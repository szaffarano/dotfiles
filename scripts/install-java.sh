#!/bin/zsh

JAVA_VER="adopt-openjdk-8u232-b09"

source $HOME/.asdf/asdf.sh

if ! $(which asdf 2> /dev/null 1>&2); then
	echo "asdf not found!"
	exit 1
fi

asdf plugin-add java
asdf plugin-add maven
asdf plugin-add gradle

asdf install java $JAVA_VER
asdf install maven latest
asdf install gradle latest

asdf global java $JAVA_VER
asdf global maven $(asdf list maven | tail -n 1)
asdf global gradle $(asdf list gradle | tail -n 1)
