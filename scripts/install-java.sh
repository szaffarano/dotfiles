#!/bin/zsh

declare -a JAVA_VERSIONS=(\
    "adopt-openjdk-8u242-b08" \
    "adopt-openjdk-11.0.6+10" \
    "adopt-openjdk-13.0.2+8" \
)

source $HOME/.asdf/asdf.sh

if ! $(which asdf 2> /dev/null 1>&2); then
	echo "asdf not found!"
	exit 1
fi

asdf plugin-add java || asdf plugin-update java
asdf plugin-add maven || asdf plugin-update maven
asdf plugin-add gradle || asdf plugin-update gradle

for JAVA_VER in "${JAVA_VERSIONS[@]}"
do 
    asdf install java $JAVA_VER
done

asdf install maven latest
asdf install gradle latest

asdf global java $JAVA_VER
asdf global maven $(asdf list maven | tail -n 1)
asdf global gradle $(asdf list gradle | tail -n 1)
