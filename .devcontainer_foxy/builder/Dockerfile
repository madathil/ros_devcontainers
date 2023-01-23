FROM mcr.microsoft.com/devcontainers/base:ubuntu-20.04
ENV DEBIAN_FRONTEND=noninteractive

RUN echo "LANG=\"en_GB.UTF-8\"" > /etc/default/locale
RUN locale-gen en_GB.UTF-8
RUN dpkg-reconfigure locales

RUN apt update
RUN apt install -y software-properties-common
RUN apt-get install -y build-essential wget curl git git-core gnupg2 lsb-release
RUN apt install -y python3-pip

# Noetic
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
RUN apt-get update && apt-get install -y ros-noetic-desktop-full
RUN apt install -y python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential
RUN apt install -y python3-rosdep

RUN echo "source /opt/ros/noetic/setup.bash" >> /home/vscode/.bashrc
RUN echo "echo source /opt/ros/noetic/setup.bash" >> /home/vscode/.bashrc

# Foxy
RUN add-apt-repository universe
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
RUN apt update && apt install -y ros-foxy-desktop python3-argcomplete

RUN echo "source /opt/ros/foxy/setup.bash" >> /home/vscode/.bashrc
RUN echo "echo source /opt/ros/foxy/setup.bash" >> /home/vscode/.bashrc

# Compilers
# RUN add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ xenial main universe"
# RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 40976EAF437D05B5 3B4FE6ACC0B21F32
# RUN apt-get update
# RUN apt-get install -y gcc-5 g++-5
# RUN apt-get install -y gdb
# RUN add-apt-repository --remove "deb http://us.archive.ubuntu.com/ubuntu/ xenial main universe"
# Using the available minimum version - closest to GCC 5.5
# RUN apt install -y gcc-7 g++-7
# RUN update-alternatives --install /usr/bin/gcc gcc 	/usr/bin/gcc-7 1
# RUN update-alternatives --install /usr/bin/g++ g++ 	/usr/bin/g++-7 1

# Install PCL, Eigen, Opencv, Boost
