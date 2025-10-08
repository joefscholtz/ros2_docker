#!/usr/bin/env bash

SCRIPT_PATH=$(dirname "$0")
DOCKER_USER="ros"
CONTAINER_NAME="ros2_humble"

temp=$(mktemp)
echo "name=\"$CONTAINER_NAME\"" >>"$temp"

docker run -it \
	--user $DOCKER_USER --network=host --ipc=host -v $SCRIPT_PATH/../..:/home/$DOCKER_USER/ros2_ws \
	-v $HOME/.gitconfig:/home/$DOCKER_USER/.gitconfig \
	-e DISPLAY=$DISPLAY \
	--name ros2_humble \
	--rm \
	-v $temp:/run/.containerenv \
	ros2_humble:dev

rm $temp
