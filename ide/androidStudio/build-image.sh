#!/bin/bash

source env.sh

docker build -f androidStudio.Dockerfile . \
             -t $IMAGE_NAME \
             --build-arg BASE_IMAGE \
             --build-arg BASE_IMAGE_VERSION \
             --build-arg JDK \
             --build-arg ANDROID_STUDIO_DOWNLOAD_URL \
             --build-arg ANDROID_STUDIO_USER \
             --build-arg CONTAINER_WORK_DIR


