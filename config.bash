export ROS_MASTER_URI=http://192.168.0.20:11311
export ROS_IP=192.168.0.20
export ROS_DOMAIN_ID=20

MOCAP_REPO="$HOME/code/acl-mocap-docker"

alias mocap="$MOCAP_REPO/docker/mocap-vicon-ros1/run.sh"
alias mocap_vicon="$MOCAP_REPO/docker/mocap-vicon-ros1/run.sh"
alias mocap_optitrack="$MOCAP_REPO/docker/mocap-optitrack-ros1/run.sh"
alias joy="$MOCAP_REPO/docker/acl-joy-ros1/run.sh"
alias ros1="$MOCAP_REPO/docker/ros1-session/run.sh"
alias bridge="$MOCAP_REPO/docker/ros-bridge/run.sh"
alias xyzrpy="$MOCAP_REPO/docker/display-vicon-ros1/run.sh 3"
alias xyy="$MOCAP_REPO/docker/display-vicon-ros1/run.sh 2"
alias xyzrpy_optitrack="$MOCAP_REPO/docker/display-optitrack-ros1/run.sh 3"
alias xyy_optitrack="$MOCAP_REPO/docker/display-optitrack-ros1/run.sh 2"
