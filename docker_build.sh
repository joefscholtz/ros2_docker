#!/usr/bin/env bash

SCRIPT_PATH=$(dirname "$0")
docker build --target ros2_docker_dev --tag ros2_docker:dev $SCRIPT_PATH
