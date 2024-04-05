#!/usr/bin/env bash

ROS_VARS="-e ROS_MASTER_URI=$ROS_MASTER_URI -e ROS_IP=$ROS_IP -e ROS_DOMAIN_ID=$ROS_DOMAIN_ID"

COMMAND="ros2 run ros1_bridge dynamic_bridge --bridge-all-topics"
#COMMAND="ros2 run ros1_bridge dynamic_bridge --bridge-all-1to2-topics"
#COMMAND="ros2 run ros1_bridge dynamic_bridge --bridge-all-2to1-topics"

docker run --rm --net=host --privileged $ROS_VARS -it ros:foxy-ros1-bridge $COMMAND
