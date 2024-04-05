#!/usr/bin/env bash

source /opt/ros/noetic/setup.bash

echo "ROS_MASTER_URI=$ROS_MASTER_URI"
echo "ROS_IP=$ROS_IP"
echo

source /root/catkin_ws/devel/setup.bash

VEH=$1
NUM=$2

if [ -z $VEH -o -z $NUM ]; then
	echo "usage: VEH NUM"
	exit 1
fi

echo "VEH=$VEH"
echo "NUM=$NUM"
echo

#roslaunch acl_joy joy.launch veh:=HX num:=21
roslaunch acl_joy joy.launch veh:=$VEH num:=$NUM
