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
You must specify either the 'mirror' parameter or the primary display and the action. Examples:

	$0 mirror
	$0 hdmi left
	$0 laptop right
	$0 hdmi off
	$0 laptop off

EOM

if [[ $# -eq 1 ]]; then
	if [[ "$1" != "mirror" ]]; then
		die "$USAGE"
	else
		action=$1
	fi
elif [[ $# -eq 2 ]]; then
	primary="$1"
	action="$2"
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
elif [[ "$action" != "mirror" ]]; then
	die "$USAGE"
fi

opts="--output $primary --auto --output $other --auto"
case "$action" in
	"mirror")
		xrandr --output "$HDMI" --auto --output "$LAPTOP" --auto --output "$HDMI" --same-as "$LAPTOP"
		exit
		;;
	"left")
		side="--left-of"
		;;
	"right")
		side="--right-of"
		;;
	"off")
		opts="--output $primary --off --output $other --auto --output $other --primary"
		side="--right-of"
		;;
	*)
		die "$action: unsupported action"
		;;
esac

xrandr $opts --output "$primary" --primary --output "$primary" "$side" "$other"
