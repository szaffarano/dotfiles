#!/bin/bash

# shellcheck disable=SC1090
source "$(dirname "$(readlink -f "$0")")/asdf-utils.sh"

declare -a JAVA_VERSIONS=(\
    "adopt-openjdk-8u242-b08" \
    "adopt-openjdk-13.0.2+8" \
    "adopt-openjdk-11.0.6+10" \
)

installOrUpdateAsdfPlugin java 
installOrUpdateAsdfPlugin maven 
installOrUpdateAsdfPlugin gradle 

for JAVA_VER in "${JAVA_VERSIONS[@]}"
do 
    installAsdfPackage java "$JAVA_VER"
done

installAsdfPackage maven latest
installAsdfPackage gradle latest
