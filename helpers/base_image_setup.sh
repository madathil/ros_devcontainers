#!/usr/bin/env bash
set -e

BUILDER_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd ''"${BUILDER_DIR}"''
/bin/bash ../.devcontainer_melodic/builder/build.sh

cd ''"${BUILDER_DIR}"''
/bin/bash ../.devcontainer_noetic/builder/build.sh
echo "Finished building images.."