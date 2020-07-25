#!/usr/bin/env bash

MVN="mvn"

read -r -d '' USAGE << EOM
$(basename "$0") downloads a maven artifact using system or user maven configuration (eg ~/.m2/settings.xml)

Usage:
    $(basename "$0") <groupId> <artifactId> <version> <package-type> [<output-dir>]

If no <output-dir> is specified, CWD will be used.
EOM
export USAGE

BASE=$( cd "$(dirname "$0")" || exit; pwd )

# shellcheck source=/dev/null
source "$BASE/common.sh"

checkParamsAtLeast $# 4

whereis $MVN > /dev/null 2>&1 || die "MVN not found" 1


GID="$1"
AID="$2"
VER="$3"
PKG="$4"
OUT=$([[ $# -eq 4 ]] && echo "." || echo "$5")

$MVN -U -Pextra-repos\
		org.apache.maven.plugins:maven-dependency-plugin:3.0.1:copy \
		-U -Dartifact="$GID:$AID:$VER:$PKG" \
		-DoutputDirectory="$OUT"
