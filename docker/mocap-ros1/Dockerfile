#FROM ros:melodic
FROM ros:noetic

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -q -y --no-install-recommends apt-utils
RUN apt-get install -q -y --no-install-recommends ros-noetic-desktop-full
RUN apt-get install -q -y --no-install-recommends net-tools iproute2 iputils-ping curl
RUN apt-get install -q -y --no-install-recommends git tmux neovim apt-utils
RUN apt-get autoremove -y
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

ENV ROS_DIR=/opt/ros/${ROS_DISTRO}
ENV WORKSPACE=/workspace
SHELL ["/bin/bash", "-c"]

# install mocap
WORKDIR /root/catkin_ws/src
RUN git clone https://gitlab.com/mit-acl/fsw/mocap
WORKDIR /root/catkin_ws
RUN . ${ROS_DIR}/setup.bash && catkin_make

# setup entrypoint
WORKDIR /root
COPY "./entrypoint.bash" /
ENTRYPOINT ["/entrypoint.bash"]
