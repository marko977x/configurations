FROM ubuntu:20.04

ADD mtkoss /mtkoss

RUN apt-get update
RUN apt-get install -y software-properties-common wget sudo nano locales
RUN locale-gen en_US.UTF-8
RUN apt-get install -y git make build-essential automake-1.15
RUN apt-get install -y aspell-doc libltdl-dev libhunspell-dev libaspell-dev
RUN apt-get install -y libxkbcommon-dev gettext pkg-config nano gperf
RUN apt-get install -y openjdk-8-jdk bison libdirectfb-dev libssl-dev
RUN apt-get install -y extra-cmake-modules gcc-multilib gyp python

RUN mkdir /cmake_build
RUN cd /cmake_build \
    && wget https://github.com/Kitware/CMake/releases/download/v3.20.0/cmake-3.20.0.tar.gz \
    && tar -xf cmake-3.20.0.tar.gz \
    && cd cmake-3.20.0 \
    && ./configure \
    && make -j16 \
    && make install
RUN rm -rf /cmake_build

RUN adduser --uid=1001 --disabled-password --gecos '' marko977x
RUN adduser marko977x sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER marko977x

ADD android-ndk-r21b /home/marko977x/android-ndk-r21b
ENV EDITOR=nano