#!/usr/bin/env bash

source /opt/ros/noetic/setup.bash

# if dim is not specified, default to 3 (options 3 or 2)
if [[ -z $1 ]]; then
    DIM="-d 3"
else
    DIM="-d $1"
fi

# if rate is not specified, default to 4Hz
if [[ -z $2 ]]; then
    RATE="-r 4"
else
    RATE="-r $2"
fi

/mocap_display.py $(rostopic list | grep -E "/\optitrack\/([^\/ ]+)\/world$" | cut -d "/" -f 3 | xargs) $DIM $RATE
