## Setup
Install docker
- See: helpers/install_docker.sh

Install VS Code

Install VS Code Extension: 
*   Dev Containers

Optional Extensions:
*    C++, Python general extensions
*    Clang Tidy, Clang Format
*    Git lens
*    Docker
*    ROS

You may need to set the environment specific to your graphics card, the default is Nvidia, See: '.devcontainer/devcontainer.json:runArgs', You may need to install the optional nvidia-container-* packages.

## Environment Setup

You will need to build the base images, 
```
cd .devcontainer/builder
./build.sh
```
See: helpers/base_image_setup.sh


Once you build the base image:

To start the development, checkout the sources into the 'catkin_ws' folder, 

Ctrl+Shitt+P -> Dev Containers: Rebuild and Reopen in Container.
The necessary libraries for ROS Melodic shall be automatically fetched and installed.

**Important**

Run the command 'xhost +' on the host machine to allow graphics from the docker container to the host display

The workspace path may not contain spaces or special characters for this devcontainer to initialize properly. 

## Notes

The .devcontainer is a symbolic link to .devcontianer_melodic, you may change this to .devcontainer_noetic to load the Noetic dev environment. Ensure to Rebuild the devcontainer once you do so, also delete the devel, build folders in the catkin_ws before the rebuild. See: helpers/switch_to_melodic.sh, helpers/switch_to_noetic.sh

The environment should be loaded for you automatically, see '.devcontainer/devcontainer.json:{postCreateCommand, postStartCommand}'

You may also need to include necessary include folders under:
*   .vscode/c_cpp_properties.json:configurations/includePath
*   .vscode/settings.json:clang-tidy.compilerArgs
