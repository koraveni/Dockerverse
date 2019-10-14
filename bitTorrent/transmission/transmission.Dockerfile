# DockerFile to download and run TRANSMISSION
# ARG are defined in build-image.sh

# build base
ARG BASE_IMAGE
ARG BASE_IMAGE_VERSION
FROM $BASE_IMAGE:$BASE_IMAGE_VERSION 

# https://github.com/moby/moby/issues/34129
ARG TRANSMISSION_DOWNLOAD_URL
ARG TRANSMISSION_USER
ARG CONTAINER_WORK_DIR

RUN set -x && \
        apk --no-cache --update add \
        # basic packages
                bash bash-completion coreutils file \
                grep openssl openssh nano sudo tar xz \
        # GUI fonts
                font-noto \
        # user utils
                shadow \
        # transmission build requirements
                build-base automake autoconf libtool \
                pkgconfig intltool curl-dev \
                glib-dev libevent-dev miniupnpc-dev \
                gtk+3.0-dev gnome-icon-theme

# Install TRANSMISSION
ENV TRANSMISSION_INSTALL_FOLDER /Transmission

RUN mkdir $TRANSMISSION_INSTALL_FOLDER

RUN set -ex && \
        wget -O- $TRANSMISSION_DOWNLOAD_URL |\
        tar -xzf - -C $TRANSMISSION_INSTALL_FOLDER --strip-components 1

RUN cd $TRANSMISSION_INSTALL_FOLDER

RUN /bin/sh -c $TRANSMISSION_INSTALL_FOLDER/autogen.sh && make -s

RUN make install

# Create a new TRANSMISSION_USER
RUN set -ex && \
        useradd --create-home --key MAIL_DIR=/dev/null --shell /bin/bash $TRANSMISSION_USER && \
        passwd -d $TRANSMISSION_USER

# Setup work directory
RUN mkdir -p $CONTAINER_WORK_DIR && \ 
    chmod -R 777 $CONTAINER_WORK_DIR

# RUN TRANSMISSION
ENTRYPOINT transmission-gtk
