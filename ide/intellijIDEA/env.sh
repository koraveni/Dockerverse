#!/bin/bash

# base 
export BASE_IMAGE="alpine"
export BASE_IMAGE_VERSION="3.8"

# java version
export JDK="openjdk8"

# intellij version
export INTELLIJ_DOWNLOAD_URL="https://download-cf.jetbrains.com/idea/ideaIC-2019.1.1-no-jbr.tar.gz"

# image name
export IMAGE_NAME="dockerverse/intellij-idea"

# container name
export CONTAINER_NAME="intellij"

# user
export INTELLIJ_USER="developer"

# container work dir (host work dir will bind with this directory inside container)
export CONTAINER_WORK_DIR=/home/$INTELLIJ_USER/IdeaProjects

# host work dir (set to home by default)
export HOST_WORK_DIR=$HOME

# Use X11 for exposing GUI (tested only on *nix systems)
# https://en.wikipedia.org/wiki/X_Window_System
# https://confluence.jetbrains.com/display/~link/Using+Intellij+as+Remote+X+Windows+App
export XSOCK="/tmp/.X11-unix"
