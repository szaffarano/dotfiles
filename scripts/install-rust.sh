#!/bin/bash

# shellcheck disable=SC1090
source "$(dirname "$(readlink -f "$0")")/asdf-utils.sh"

installOrUpdateAsdfPlugin rust

installAsdfPackage rust latest
