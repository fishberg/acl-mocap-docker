#FROM ros:melodic
FROM ros:noetic

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -q -y --no-install-recommends apt-utils
RUN apt-get install -q -y --no-install-recommends ros-noetic-desktop-full
RUN apt-get install -q -y --no-install-recommends net-tools iproute2 iputils-ping curl
RUN apt-get install -q -y --no-install-recommends git tmux neovim apt-utils
RUN apt-get install -q -y --no-install-recommends python-is-python3 python3-pip
RUN apt-get autoremove -y
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

RUN pip install numpy
RUN pip install scipy
RUN pip install pandas
RUN pip install tabulate

COPY "./mocap_display.py" /
COPY "./entrypoint.bash" /
ENTRYPOINT ["/entrypoint.bash"]
