#!/bin/zsh

if [ $# -ne 2 ]; then
	echo "Usage $0 <times> <command>"
	exit 1
fi

TIMES=$1
COMMAND=$2
C=0
while [ $C -lt $TIMES ]; do
	eval $COMMAND
	C=$((C + 1))
done
