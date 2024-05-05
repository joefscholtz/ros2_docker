# ROS 2 Docker

My workflow to run ros2 applications inside Docker, including base stage to deploy applications and develop stage with mypersonal configuration.

## Install

In order to order to make use of the development workflow, it is needed to clone the submodules alongside the repo with:

```bash
git clone --recursive git@github.com:joefscholtz/ros2_docker.git
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

## TODO

- [ ] Use Docker compose instead of shell script;
- [ ] Use base stage as default, without the need to add the --target flag when building;
- [ ] Fix starship not showing username (why?? grrr);
- [x] Get Gazebo working (😎);
- [ ] Connect to lsp servers inside docker using Neovim.

## Special thanks

- [Allison Thackston](https://github.com/athackst) for her [dockerfiles repo](https://github.com/athackst);
- [Josh Newans from Articulated Robotics](https://www.youtube.com/@ArticulatedRobotics)
