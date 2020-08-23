#!/bin/bash

source env.sh

docker build -f vsCode.Dockerfile . \
             -t $IMAGE_NAME \
             --build-arg UBUNTU_VERSION \
             --build-arg VSCODE_SOURCE_URL \
             --build-arg VSCODE_USER \
             --build-arg CONTAINER_WORK_DIR


