#!/usr/bin/env bash

function usage() {
	#echo "Usage: $0 <jar file>"
	echo "$USAGE"
	exit 1
}

function die() {
	echo "$1"
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


