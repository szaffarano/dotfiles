#!/usr/bin/env bash

function usage() {
	#echo "Usage: $0 <jar file>"
	echo "$USAGE"
	exit 1
}

#
# $1: message
# $2: log file
# $3: exit code
#
function logAndDie() {
	echo >&2 "$1" | tee -a "$2"
	exit "$3"
}

#
# $1: message
# $2: exit code
#
function die() {
	echo >&2 "$1"
	exit "$2"
}

function checkParamsAtLeast() {
	if [[ $1 -lt $2 ]]; then
		usage
		exit 1
	fi
}

function checkParams() {
	if [[ $1 -ne $2 ]]; then
		usage
		exit 1
	fi
}

function isValidFile() {
	[[ -f "$1" ]] || die "$1: not found" 1
}

function isValidDir() {
	[[ -d "$1" ]] || die "$1: not found" 2
}
