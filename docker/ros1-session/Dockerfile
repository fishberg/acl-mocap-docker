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

COPY _bashrc /root/_bashrc
RUN echo source /root/_bashrc >> ~/.bashrc

#RUN echo PS1=\"[\\[\\033[34m\\]ros1-session] \\u@\\h:\\w$ \" >> ~/.bashrc
