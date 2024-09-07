#!/usr/bin/env bash

source /opt/ros/noetic/setup.bash

echo "ROS_MASTER_URI=$ROS_MASTER_URI"
echo "ROS_IP=$ROS_IP"
echo

source /root/catkin_ws/devel/setup.bash
roslaunch mocap optitrack.launch ns:=optitrack
