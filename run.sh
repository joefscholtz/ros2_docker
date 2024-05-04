#!/usr/bin/env bash

SCRIPT_PATH=$(dirname "$0")

docker run -it \
	--user ros --network=host --ipc=host -v $SCRIPT_PATH/ros2_ws \
	-e XDG_RUNTIME_DIR=/tmp \
	-e WAYLAND_DISPLAY=$WAYLAND_DISPLAY \
	-v $XDG_RUNTIME_DIR/$WAYLAND_DISPLAY:/tmp/$WAYLAND_DISPLAY \
	-v /dev/dri:/dev/dri \
	-e QT_QPA_PLATFORM=wayland \
	ros2_ws \
	\
	#dbus-launch #waylandapplication #--user ros \
