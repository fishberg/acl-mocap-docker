#!/usr/bin/env bash

source /opt/ros/noetic/setup.bash

if [[ -z $1 ]]; then
    DIM="-d 3"
else
    DIM="-d $1"
fi

if [[ -z $2 ]]; then
    RATE="-r 4"
else
    RATE="-r $2"
fi

/mocap_display.py $(rostopic list | grep -E "\/([^\/ ]+)\/world$" | cut -d "/" -f 2 | xargs) $DIM $RATE
