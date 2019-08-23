#!/bin/bash

source env.sh

docker build -f intellijIDEA.Dockerfile . \
             -t $IMAGE_NAME \
             --build-arg BASE_IMAGE \
             --build-arg BASE_IMAGE_VERSION \
             --build-arg JDK \
             --build-arg INTELLIJ_DOWNLOAD_URL \
             --build-arg INTELLIJ_USER \
             --build-arg CONTAINER_WORK_DIR


