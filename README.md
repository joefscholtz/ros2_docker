# ROS 2 Docker

My workflow to run ros2 applications inside Docker, including base stage to deploy applications and develop stage with mypersonal configuration.

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

## TODO

- [ ] Use Docker compose instead of shell script
- [ ] Use base stage as default, without the need to add the --target flag when building
- [ ] Get Gazebo working
- [ ] Connect to lsp servers inside docker using Neovim
