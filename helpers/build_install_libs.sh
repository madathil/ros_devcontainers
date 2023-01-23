#!/bin/bash
set -e

BUILD_DIR=''"${containerWorkspaceFolder}"'/lib'
mkdir -p ''"${BUILD_DIR}"''
echo "LIB dir: ${BUILD_DIR}"

function build_and_install()
{
    local github_url="$1"
    local git_tag="$2"
    local repo_name="$(basename ${github_url} .git)"
    local installed_tar="${git_tag}.tar.gz"

    echo "Build and install: ${github_url} with tag: ${git_tag} "
    cd ''"${BUILD_DIR}"''

    git clone --branch ${git_tag} "${github_url}" ${repo_name} || true
    cd ''"${BUILD_DIR}/${repo_name}"''
    rm -rf ''"${BUILD_DIR}/${repo_name}/${git_tag}"'' || true
    # git_tag="$(git describe --tags --abbrev=0)"
    if [ -f "${installed_tar}" ]; then
        echo "${installed_tar} exists.."
        tar -xvf "${installed_tar}"
    else
        echo "Building ${repo_name}..."
        rm -rf build || true
        mkdir -p build "${git_tag}"
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH="${BUILD_DIR}/${repo_name}/${git_tag}" .. 
        make -j $(nproc)
        make install
        cd ''"${BUILD_DIR}/${repo_name}"''
        tar -cvf "${installed_tar}" "${git_tag}"
        rm -rf ''"${BUILD_DIR}/${repo_name}/build"''
    fi
    echo "Installing ${repo_name}..."
    cd ''"${BUILD_DIR}/${repo_name}"''
    echo sudo rsync -a "${git_tag}/" "/usr/local/"
    sudo rsync -a "${git_tag}/" "/usr/local/"
    rm -rf "${git_tag}" || true
}

build_and_install "https://github.com/Kitware/VTK.git" "v8.2.0"
build_and_install "https://github.com/PointCloudLibrary/pcl.git" "pcl-1.9.1"
# boost, eigen, flann is part of ROS1 Melodic desktop-full I believe
echo "Done: build and install."