#!/usr/bin/env bash

SCRIPT_PATH=$(dirname "$0")
DOCKER_USER="ros"
docker run -it \
	--user $DOCKER_USER --network=host --ipc=host -v $SCRIPT_PATH/ros2_ws:/home/$DOCKER_USER/ros2_ws \
	-v $HOME/.gitconfig:/home/$DOCKER_USER/.gitconfig \
	--cpus "4" \
	--memory "2.5g" \
	-e DISPLAY=$DISPLAY \
	--rm \
	ros2_docker:dev
