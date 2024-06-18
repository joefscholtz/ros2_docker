#!/usr/bin/env bash

SCRIPT_PATH=$(dirname "$0")
DOCKER_USER="ros"

CONTAINER_NAME="ros2_docker"

temp=$(mktemp)
echo "name=\"$CONTAINER_NAME\"" >> "$temp"

docker run -it \
	--user $DOCKER_USER --network=host --ipc=host -v $SCRIPT_PATH/ros2_ws:/home/$DOCKER_USER/ros2_ws \
  -v $SCRIPT_PATH/.config:/home/$DOCKER_USER/.config \
	-v $HOME/.gitconfig:/home/$DOCKER_USER/.gitconfig \
	--cpus "4" \
	--memory "2.5g" \
	-e DISPLAY=$DISPLAY \
	--rm \
  --name $CONTAINER_NAME \
  -v $temp:/run/.containerenv \
	ros2_docker:dev

rm $temp
