#!/bin/bash

# base 
export BASE_IMAGE="alpine"
export BASE_IMAGE_VERSION="3.8"

# transmission version
export TRANSMISSION_DOWNLOAD_URL="https://github.com/transmission/transmission/archive/2.94.tar.gz"

# image name
export IMAGE_NAME="dockerverse/transmission"

# container name
export CONTAINER_NAME="transmission"

# user
export TRANSMISSION_USER="developer"

# container work dir (host work dir will bind with this directory inside container)
export CONTAINER_WORK_DIR=/home/$TRANSMISSION_USER/TransmissionDownloads

# host work dir (set to home by default)
export HOST_WORK_DIR=$HOME

# Use X11 for exposing GUI (tested only on *nix systems)
# https://en.wikipedia.org/wiki/X_Window_System
export XSOCK="/tmp/.X11-unix"
