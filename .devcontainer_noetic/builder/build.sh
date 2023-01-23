#!/bin/bash
set -e

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd ''"${SCRIPT_DIR}"''
docker build . -t vcnoetic:latest
docker build -t vcnoetic_dev_overlay:latest -f ''"${SCRIPT_DIR}"'/../../.dev_overlay/Dockerfile' --build-arg IMAGE=vcnoetic --build-arg TAG=latest .
