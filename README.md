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

## Usage

It is possible to add ROS 2 packages or meta-packages inside `ros2_ws/src`, extend the `ros2_docker:<tag>` by copying the files inside the `ros2_ws/src/ros2_package` folder in you package folder `ros2_ws/src/<package name>` and adding the package dependencies in the `ros2_package.Dockerfile` file, and then running with the `x11run.sh` file.

Don't forget to run the proper `ros2 pkg create` to create a package inside `ros2_ws/src`. The `ros2_docker` images can be used for it.

## TODO

- [ ] Use Docker compose instead of shell script?;
- [ ] Rethink the strategy that is being used to add ROS 2 packages;
- [ ] Use base stage as default, without the need to add the --target flag when building;
- [ ] Fix starship not showing username (why?? grrr);
- [x] Get Gazebo working (😎);
- [ ] Connect to lsp servers inside docker using Neovim.

## Special thanks

- [Allison Thackston](https://github.com/athackst) for her [dockerfiles repo](https://github.com/athackst);
- [Josh Newans from Articulated Robotics](https://www.youtube.com/@ArticulatedRobotics)
