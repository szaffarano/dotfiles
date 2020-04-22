#!/bin/bash

PIDS=$(jps -v \
	| grep Bootstrap \
	| grep -v Studio \
	| cut -d" " -f 1 \
	| tr "\n" " ")

M_INSTANCES=$(echo "$PIDS" | wc -w)

if [[ -z "$PIDS" ]]; then
	echo "No mule runtime instance running"
	exit 1
elif [[ $M_INSTANCES -gt 1 ]]; then
	echo "$M_INSTANCES instances of mule runtime found, expected 1: $PIDS"
	exit 2
else
	echo "$PIDS"
fi