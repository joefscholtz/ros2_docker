#!/usr/bin/env bash

SCRIPT_PATH=$(dirname "$0")
DOCKER_USER="ros"
docker run -it \
	--user $DOCKER_USER --network=host --ipc=host -v $SCRIPT_PATH/ros2_ws:/home/$DOCKER_USER/ros2_ws \
	-v $HOME/dotfiles/:/dotfiles/ \
	-e DISPLAY=$DISPLAY \
	ros2_ws
