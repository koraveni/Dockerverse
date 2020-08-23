# DockerFile to download and run VSCode IDE on ubuntu along with node and npm
# ARG are defined in build-image.sh

# build base
ARG UBUNTU_VERSION
FROM ubuntu:$UBUNTU_VERSION 

# https://github.com/moby/moby/issues/34129
ARG VSCODE_SOURCE_URL
ARG VSCODE_USER
ARG CONTAINER_WORK_DIR

RUN apt update && apt install -y \
        # basic packages
                bash bash-completion coreutils file \
                git grep openssl nano sudo curl tar wget \
        # debug tools
                gdb strace 

## Electron dependencies
# https://www.electronjs.org/docs/development/build-instructions-linux
RUN apt install -y build-essential clang libdbus-1-dev libgtk-3-dev \
                       libnotify-dev libgnome-keyring-dev \
                       libasound2-dev libcap-dev libcups2-dev libxtst-dev \
                       libxss1 libnss3-dev gcc-multilib g++-multilib \
                       gperf bison python-dbusmock openjdk-8-jre

# Install Node and npm
RUN apt install -y nodejs npm

# Install VSCODE
ENV VSCODE_INSTALL_FOLDER /VSCode

RUN mkdir $VSCODE_INSTALL_FOLDER

RUN set -ex && \
        wget -O- $VSCODE_SOURCE_URL |\
        tar -xzf - -C $VSCODE_INSTALL_FOLDER --strip-components 1

# Create a new VSCODE_USER
RUN set -ex && \
        useradd --create-home --key MAIL_DIR=/dev/null \
                --shell /bin/bash $VSCODE_USER

# Add VSCODE_USER to sudo group
RUN adduser $VSCODE_USER sudo

# Set VSCODE_USER Password as 'password'
RUN echo $VSCODE_USER':password' | chpasswd

# Set Password for root as 'password'
RUN echo 'root:password' | chpasswd

# Setup work directory
RUN mkdir -p $CONTAINER_WORK_DIR && \ 
    chmod -R 777 $CONTAINER_WORK_DIR

# RUN VSCode
# https://github.com/electron/electron/issues/17972#issuecomment-487369441
ENTRYPOINT .$VSCODE_INSTALL_FOLDER/code --no-sandbox
