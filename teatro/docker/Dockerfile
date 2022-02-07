FROM ubuntu:16.04

RUN apt-get update
RUN apt install -y \
    software-properties-common sudo nano

RUN apt-get install locales
RUN locale-gen en_US.UTF-8

RUN apt-get install -y git make build-essential automake-1.15 \
    aspell-doc libltdl-dev libhunspell-dev libaspell-dev \
    libxkbcommon-dev gettext pkg-config python nano gperf \
    openjdk-8-jdk bison libdirectfb-dev wget libssl-dev \
    extra-cmake-modules

RUN mkdir /cmake_build

RUN cd /cmake_build \
    && wget https://github.com/Kitware/CMake/releases/download/v3.20.0/cmake-3.20.0.tar.gz \
    && tar -xf cmake-3.20.0.tar.gz \
    && cd cmake-3.20.0 \
    && ./configure \
    && make -j16 \
    && make install
RUN rm -rf /cmake_build

RUN apt install -y gcc-multilib gyp

ADD mtkoss /mtkoss

RUN adduser --uid=1001 --disabled-password --gecos '' marko977x
RUN adduser marko977x sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER marko977x

ADD android-ndk-r21b /home/marko977x/android-ndk-r21b

ENV EDITOR=nano
