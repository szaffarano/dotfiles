#!/usr/bin/env zsh

# based on https://unix.stackexchange.com/questions/233345/how-can-i-easily-make-screenshots-of-screen-regions-on-arch-linux-with-i3-wm

# screenshots stuff
# TODO: docs

function die {
	if [ -n "${1}" ]; then
		echo "${1}"
	fi
	cat <<-EOF
		    Usage: $0 [-h|-s] [<target folder>]

		    Take screenshot of a whole screen or a specified region,
		    save it to a specified folder (default is working directori)
		    and copy it to the clipboard. 

		       -h   - print help and exit
		       -s   - take a screenshot of a screen region
	EOF
	if [ -n "${1}" ]; then
		exit 1
	fi
	exit 0
}

if ! zparseopts -output:=output h=help s=region; then
	die "Error parsing arguments"
fi

[[ -n $help ]] && die

if [[ -z $region ]]; then
	params=("-window" "root")
else
	params=""
fi

if [[ -z $output ]]; then
	output="$(pwd)"
elif ! [[ -d $output[2] ]]; then
	die "$output[2]: is not a directory"
else
	output=$output[2]
fi

capture=${output}/$(date '+%Y-%m-%d_%H-%M-%S')_screenshot.png
import ${params} $capture
xclip -selection clipboard -target image/png -i <"$capture"
