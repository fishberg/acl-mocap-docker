#!/usr/bin/env bash

ROS_VARS="-e ROS_MASTER_URI=$ROS_MASTER_URI -e ROS_IP=$ROS_IP"

docker run --rm --net=host $ROS_VARS -it acl-mocap-display-ros1 $1 $2
