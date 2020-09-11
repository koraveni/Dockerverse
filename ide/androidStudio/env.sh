#!/bin/bash

# base 
export BASE_IMAGE="alpine"
export BASE_IMAGE_VERSION="3.11"

# java version
export JDK="openjdk11"

# intellij version
export ANDROID_STUDIO_DOWNLOAD_URL="https://r1---sn-gwpa-itqr.gvt1.com/edgedl/android/studio/ide-zips/4.0.1.0/android-studio-ide-193.6626763-linux.tar.gz"

# image name
export IMAGE_NAME="dockerverse/android-studio"

# container name
export CONTAINER_NAME="android"

# user
export ANDROID_STUDIO_USER="developer"

# container work dir (host work dir will bind with this directory inside container)
export CONTAINER_WORK_DIR=/home/$ANDROID_STUDIO_USER/AndroidProjects

# host work dir (set to home by default)
export HOST_WORK_DIR=$HOME

# Use X11 for exposing GUI (tested only on *nix systems)
# https://en.wikipedia.org/wiki/X_Window_System
# https://confluence.jetbrains.com/display/~link/Using+Intellij+as+Remote+X+Windows+App
export XSOCK="/tmp/.X11-unix"
