# ROS 2 Docker

My workflow to run ros2 applications inside Docker, including base stage to deploy applications and develop stage with mypersonal configuration.

## Preview

Preview of the [Docker](https://www.docker.com/) image provided by this package simulating the [Turtlebot3 waffle](https://github.com/ROBOTIS-GIT/turtlebot3) with [Gazebo](https://gazebosim.org). Inside the container, the following instructions were executed

```bash
sudo apt install ros-humble-turtlebot3 ros-humble-turtlebot3-simulations
export TURTLEBOT3_MODEL=waffle
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:/opt/ros/$ROS_DISTRO/share/turtlebot3_gazebo/models
. ~/.zshrc # or .bashrc if the ros2_docker:base image is being used
ros2 launch turtlebot3_gazebo turtlebot3_world.launch
```

and this is the result:

![Turtlebot3 Gazebo preview](assets/tb3_gazebo_preview.png)

## Install

Clone the repository

```bash
git clone git@github.com:joefscholtz/ros2_docker.git
```

## Build

Build base stage to deploy

```bash
docker build --target ros2_docker_base --tag ros2_docker:base <path_to_ros2_docker>
```

Build develop stage with my personal workflow

```bash
docker build --target ros2_docker_dev --tag ros2_docker:dev <path_to_ros2_docker>
```

Alternatively, if you are already inside `<path_to_ros2_docker>`

```bash
docker build --target ros2_docker_dev --tag ros2_docker:dev .
```

## Run

Use the run script in order to use GUI applications with:

```bash
<path_to_ros2_docker>/x11run.sh
```

## Usage

It is possible to add ROS 2 packages or meta-packages inside `ros2_ws/src`, extend the `ros2_docker:<tag>` by copying the files inside the `ros2_ws/src/ros2_package` folder in you package folder `ros2_ws/src/<package name>` and adding the package dependencies in the `ros2_package.Dockerfile` file, and then running with the `x11run.sh` file.

Don't forget to run the proper `ros2 pkg create` to create a package inside `ros2_ws/src`. The `ros2_docker` images can be used for it.

## TODO

- [ ] Add license
- [ ] Use Docker compose instead of shell script?;
- [ ] Rethink the strategy that is being used to add ROS 2 packages;
- [ ] Use base stage as default, without the need to add the --target flag when building;
- [ ] Fix starship not showing username (why?? grrr);
- [x] Get Gazebo working (😎);
- [ ] Connect to lsp servers inside docker using Neovim.

## Special thanks

- [Allison Thackston](https://github.com/athackst) for her [dockerfiles repo](https://github.com/athackst);
- [Josh Newans from Articulated Robotics](https://www.youtube.com/@ArticulatedRobotics)
