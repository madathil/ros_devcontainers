#!/bin/bash
set -e

''"${containerWorkspaceFolder}"'/helpers/build_install_libs.sh'
cd ''"${containerWorkspaceFolder}"'/catkin_ws'
sudo rosdep init
rosdep update
rosdep install --from-paths src --ignore-src -r -y
