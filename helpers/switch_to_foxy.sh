#!/usr/bin/env bash
set -e

scriptdir="$( dirname -- "$BASH_SOURCE"; )";
cd "${scriptdir}/.."
rm .devcontainer
ln -s .devcontainer_foxy .devcontainer
