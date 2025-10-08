#!/usr/bin/env bash

SCRIPT_PATH=$(dirname "$0")
docker build --target ros2_humble_dev --tag ros2_humble:dev $SCRIPT_PATH
