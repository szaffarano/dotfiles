#!/bin/bash

# Cron script for 30-min activity journal
# see: http://www.stochasticgeometry.ie/2012/11/23/vimwiki/

export DISPLAY=:0

/usr/bin/gvim \
	-geometry 100×40+512+400 \
  -c "call vimwiki#diary#make_note(v:count1)" + \
  -c "r !date +'\%T:  '" \
	-c "call cursor(line('.'), 99999)" \
  -c "startinsert"
