#!/usr/bin/env bash

function die {
	echo "$1"
	if [[ "$#" -gt 1 ]]; then
		exit "$2" 
	else
		exit 1
	fi
}

read -r -d '' USAGE << EOM
You must specify either the 'mirror' parameter or the primary display and the layout. Examples:

	$0 mirror
	$0 HDMI left
	$0 LAPTOP right

EOM

if [[ $# -eq 1 ]]; then
	if [[ "$1" != "mirror" ]]; then
		die "$USAGE"
	else
		layout=$1
	fi
elif [[ $# -eq 2 ]]; then
	primary="$1"
	layout="$2"
else
	die "$USAGE"
fi

displays=$(xrandr| grep " connected " | cut -d" " -f1)
displays_count=$(echo "$displays" | wc -l)

case "$displays_count" in
	1)
		echo "Single monitor detected, nothing to do"
		exit 0
		;;
	2)
		LAPTOP=$(echo "$displays" | grep -vi hdmi)
		HDMI=$(echo "$displays" | grep -i hdmi)
		;;
	*)
		LAPTOP=$(echo "$displays" | grep -vi hdmi | head -n 1)
		HDMI=$(echo "$displays" | grep -i hdmi | head -n 1)
		echo "Warning: $displays_count detected! taking $LAPTOP and $HDMI"
		;;
esac

if [[ "$primary" = "laptop" ]]; then
	primary="$LAPTOP"
	other="$HDMI"
elif [[ "$primary" = "hdmi" ]]; then
	primary="$HDMI"
	other="$LAPTOP"
elif [[ "$layout" != "mirror" ]]; then
	die "$USAGE"
fi

case "$layout" in
	"mirror")
		xrandr --output "$HDMI" --same-as "$LAPTOP"
		;;
	"left")
		side="--left-of"
		;;
	"right")
		side="--right-of"
		;;
	*)
		die "$layout: unsupported layout"
		;;
esac

xrandr --output "$primary" --primary --output "$primary" $side  "$other"
