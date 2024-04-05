#!/usr/bin/env bash

CURR_DIR=$(dirname $0)
cd $CURR_DIR

mkdir -p /ros1_ws/$USER
cp -n _bashrc /ros1_ws/$USER/.bashrc

SHARE_USER="-v /etc/group:/etc/group:ro -v /etc/passwd:/etc/passwd:ro -v /etc/shadow:/etc/shadow:ro -u `id -u`:`id -g`"
VOLUMES="-v /ros1_ws/$USER:/home/$USER -w=/home/$USER"
ROS_VARS="-e ROS_MASTER_URI=$ROS_MASTER_URI -e ROS_IP=$ROS_IP"

docker run --rm --net=host --privileged $SHARE_USER $VOLUMES $ROS_VARS -it acl-ros1-session
