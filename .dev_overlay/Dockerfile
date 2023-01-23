ARG IMAGE=IMAGE
ARG TAG=TAG
FROM $IMAGE:$TAG
ENV DEBIAN_FRONTEND=noninteractive
# RUN add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main restricted universe multiverse"
RUN apt update
RUN apt install -y software-properties-common

# Env tools
RUN apt install -y clang clang-tidy clang-tools clang-format
RUN apt install -y gdb
# X Test Apps
RUN apt install -y x11-apps mesa-utils 