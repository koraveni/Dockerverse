# DockerFile to download and run IntellijIDEA CE
# ARG are defined in build-image.sh

# build base
ARG BASE_IMAGE
ARG BASE_IMAGE_VERSION
FROM $BASE_IMAGE:$BASE_IMAGE_VERSION 

# https://github.com/moby/moby/issues/34129
ARG JDK
ARG ANDROID_STUDIO_DOWNLOAD_URL
ARG ANDROID_STUDIO_USER
ARG CONTAINER_WORK_DIR

RUN set -x && \
        apk --no-cache --update add \
        # basic packages
                bash bash-completion coreutils file \
                git grep openssl openssh nano sudo tar xz \
        # debug tools
                gdb musl-dbg strace \
        # docs and man
                bash-doc man man-pages less less-doc \
        # GUI fonts
                font-noto \
        # user utils
                shadow

# Install Java 
RUN set -ex && apk --no-cache --update add $JDK

# Install Maven          
RUN set -ex && apk --no-cache --update add maven

# Install IntelliJ Community
ENV ANDROID_STUDIO_INSTALL_FOLDER /AndroidStudio

RUN mkdir $ANDROID_STUDIO_INSTALL_FOLDER

RUN set -ex && \
        wget -O- $ANDROID_STUDIO_DOWNLOAD_URL |\
        tar -xzf - -C $ANDROID_STUDIO_INSTALL_FOLDER --strip-components 1

# Create a new INTELLIJ_USER
RUN set -ex && \
        useradd --create-home --key MAIL_DIR=/dev/null --shell /bin/bash $ANDROID_STUDIO_USER && \
        passwd -d $ANDROID_STUDIO_USER

# Setup work directory
RUN mkdir -p $CONTAINER_WORK_DIR && \ 
    chmod -R 777 $CONTAINER_WORK_DIR

# RUN Intellij IDEA
ENTRYPOINT /bin/sh -c $ANDROID_STUDIO_INSTALL_FOLDER/bin/studio.sh
