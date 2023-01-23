#!/bin/bash
set -e

cd ''"${containerWorkspaceFolder}"'/catkin_ws'
sudo rosdep init
rosdep update
rosdep install --from-paths src --ignore-src -r -y
