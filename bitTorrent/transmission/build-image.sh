#!/bin/bash

source env.sh

docker build -f transmission.Dockerfile . \
             -t $IMAGE_NAME \
             --build-arg BASE_IMAGE \
             --build-arg BASE_IMAGE_VERSION \
             --build-arg TRANSMISSION_DOWNLOAD_URL \
             --build-arg TRANSMISSION_USER \
             --build-arg CONTAINER_WORK_DIR


