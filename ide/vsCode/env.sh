#!/bin/bash

# base 
export UBUNTU_VERSION="18.04"

# vscode version
export VSCODE_SOURCE_URL="https://update.code.visualstudio.com/latest/linux-x64/stable"

# image name
export IMAGE_NAME="dockerverse/vscode"

# container name
export CONTAINER_NAME="vscode"

# user
export VSCODE_USER="developer"

# container work dir (host work dir will bind with this directory inside container)
export CONTAINER_WORK_DIR=/home/$VSCODE_USER/VSCodeProjects

# host work dir (set to home by default)
export HOST_WORK_DIR=$HOME

# Use X11 for exposing GUI (tested only on *nix systems)
# https://en.wikipedia.org/wiki/X_Window_System
# https://confluence.jetbrains.com/display/~link/Using+Intellij+as+Remote+X+Windows+App
export XSOCK="/tmp/.X11-unix"
