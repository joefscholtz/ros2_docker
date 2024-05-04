#!/usr/bin/env bash

set -e

. /opt/ros/humble/setup.bash

echo "Provided arguments: $@"

exec $@
