FROM mcr.microsoft.com/devcontainers/base:ubuntu-18.04
ENV DEBIAN_FRONTEND=noninteractive

RUN echo "LANG=\"en_GB.UTF-8\"" > /etc/default/locale
RUN locale-gen en_GB.UTF-8
RUN dpkg-reconfigure locales

RUN apt update
RUN apt install -y software-properties-common
RUN apt install -y build-essential wget curl git git-core gnupg2 lsb-release

#Melodic
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
RUN apt update && apt install -y ros-melodic-desktop-full
RUN echo "source /opt/ros/melodic/setup.bash" >> /home/vscode/.bashrc
RUN echo "echo loading /opt/ros/melodic/setup.bash" >> /home/vscode/.bashrc

RUN apt install -y python3-pip
RUN apt install -y python3-rosdep python3-wstool build-essential

RUN apt install -y gcc-5 g++-5 
RUN update-alternatives --install /usr/bin/gcc gcc 	/usr/bin/gcc-5 1
RUN update-alternatives --install /usr/bin/g++ g++ 	/usr/bin/g++-5 1
