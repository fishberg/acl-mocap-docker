# acl-mocap-docker

Repo for setting up some useful tools for `aldrin` mocap computer in ACL. Once finalized this repo will move to an official ACL GitHub/GitLab location.

## Quick Start (Setup ROS2 on `aldrin`)
```bash
echo -e "\n# installed ros2\nsource /opt/ros/humble/setup.bash" >> ~/.bashrc
source ~/.bashrc
```

## Quick Start (Setup Docker)
```bash
# add docker group to your user
sudo usermod -aG docker ${USER}

# apply new group membership to current session
su - ${USER}
```
* [Reference](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-22-04)

## Qucik Start (Setup mocap)
```bash
mkdir -p ~/code
cd ~/code
git clone https://github.com/fishberg/acl-mocap-docker.git
echo -e "\n# installed acl-mocap-docker\nsource ~/code/acl-mocap-docker/config.bash" >> ~/.bashrc
source ~/.bashrc
```
* `config.bash` does two important things:
  * Sets `ROS_MASTER_URI`, `ROS_IP`, and `ROS_DOMAIN_ID` to `aldrin`'s default settings (if you're using different settings, make sure this doesn't override something you care about!).
  * Setups aliases for easily launching these docker containers (see below).

## Aliases
* `mocap`: Starts `mocap vicon.launch` in ROS1. (e.g., `mocap`)
* `joy`: Starts `acl_joy joy.launch` in ROS1, you need to provide a veh and num. (e.g., `joy HX 21`)
* `ros1`: Starts a ROS1 session so you can use ROS1 tools like `rostopic`, `rosbag`, etc. Container's home folder mapped to `/ros1_ws/$USER` on host system. (e.g., `ros1`)
* `bridge`: Starts a `ros1 <-> ros2` bridge using ROS1 Noetic and ROS2 Foxy. (e.g., `bridge`)

* Note: You should not need to build the Docker images if you're on `aldrin`. That being said, you can build each image by navigating to each directory `./docker/*` and running `./build.sh` locally.

## Quick Start (Flight Demo)
```bash
# Terminal 1
mocap

# Terminal 2
joy HX 21 # <- use correct vehicle/numbers

# Terminal 3
ssh root@hx21.local
fly
# make sure drone's `.bashrc` has `ROS_MASTER_URI` set to `192.168.0.20` for `aldrin` and not `192.168.0.19` for `sikorsky`
```

1. Before Take Off, make sure Vicon data in top left window looks sane (especially look at Z position)
2. Test "Motors On" in top left window by pressing A (Motors On: N -> Motors On: Y) and B (Motors On: Y -> Motors On: N)
3. To ARM, click in DISARMED window and press SPACE
```
Controller Commands:
- A Button: Take off
- B Button: Kill
- X Button: Land
- Left Stick Up/Down: Z+/-
- Left Stick Left/Right: Yaw
- Right Stick Up/Down: Mocap x+/-
- Right Stick Left/Right: Mocap y+/-
```
4. When landing, press X to get on ground, then kill with B

## Flight LiPo Battery Info
To Turn on Hex, plug in battery:
- Full Voltage: 16.7V
- Lowest Fly is: 15.6V

Always charge with "LiPo Balanced Mode - 3.3A 14.8V"
Long press Enter to accept setting and press Enter again to start charging
