#/usr/bin/env bash

ROS_VARS="-e ROS_MASTER_URI=$ROS_MASTER_URI -e ROS_IP=$ROS_IP"
DEVICES="--device=/dev/input/js0"

if [ ! -c /dev/input/js0 ]; then
    echo "error: did not detect /dev/input/js0"
    exit 1
fi

VEH=$1
NUM=$2

if [ -z $VEH -o -z $NUM ]; then
    echo "usage: VEH NUM (e.g., HX 21)"
	exit 1
fi

docker run --rm --net=host --privileged $ROS_VARS $DEVICES -it acl-joy-ros1 $VEH $NUM
