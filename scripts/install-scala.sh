#!/bin/zsh

JAR_VER="1.0.0"
SCALA_VER="2.12"

BASE_URL="https://oss.sonatype.org/content/repositories/releases/org/scalastyle"
JAR_URL="${BASE_URL}/scalastyle_${SCALA_VER}/${JAR_VER}/scalastyle_${SCALA_VER}-${JAR_VER}-batch.jar"

INSTALL_DIR="${HOME}/.local/scalastyle"
JAR_PATH="${INSTALL_DIR}/scalastyle-batch.jar"

. ~/.dotfiles/zsh/sdkman.sh

if ! $(which sdk 2> /dev/null 1>&2); then
	echo "SDK not found!"
	exit 1
fi

sdk install scala

if ! [ -e ${JAR_PATH} ]; then
	mkdir -p ${INSTALL_DIR}
	curl -L ${JAR_URL} -o ${JAR_PATH}
fi
