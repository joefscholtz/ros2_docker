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
docker build -t <image_name> . -t base
```

Build develop stage with my personal workflow

```bash
docker build -t <image_name> . -t dev
```

## Run

Use the run script in order to use GUI applications with:

```bash
<path_to_ros2_docker>/x11run.sh
```

## TODO

- [ ] Use Docker compose instead of shell script
- [ ] Use base stage as default, without the need to add the --target flag when building
- [ ] Get Gazebo working
- [ ] Connect to lsp servers inside docker using Neovim
