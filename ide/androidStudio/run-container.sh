#!/bin/bash

source env.sh

if [ "$1" ];then
   export HOST_WORK_DIR="$1"
   echo "HOST_WORK_DIR : " $HOST_WORK_DIR
fi

docker container run --name $CONTAINER_NAME \
                     -v $XSOCK:$XSOCK \
                     -v $HOST_WORK_DIR:$CONTAINER_WORK_DIR \
                     -u $ANDROID_STUDIO_USER \
                     -e DISPLAY \
                     -t $IMAGE_NAME


