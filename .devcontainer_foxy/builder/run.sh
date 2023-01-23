#!/bin/bash
set -e

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd ''"${SCRIPT_DIR}"''
xhost local:root
docker run --rm -it -e DISPLAY="${DISPLAY}" -v /tmp/.X11-unix:/tmp/.X11-unix:ro vcfoxy:latest /usr/bin/bash
