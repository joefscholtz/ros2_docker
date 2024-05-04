#!/usr/bin/env bash

SCRIPT_PATH=$(dirname "$0")

docker run -it \
	--user ros --network=host --ipc=host -v $SCRIPT_PATH/ros2_ws \
	-v $HOME/dotfiles/:/dotfiles/ \
	-e DISPLAY=$DISPLAY \
	ros2_ws
