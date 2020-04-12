#!/bin/bash -ex

#---------- Version ----------
DOCKER_CE_VERSION="3:19.03.8-3.el7"
CONTAINERD="https://download.docker.com/linux/centos/7/x86_64/stable/Packages/containerd.io-1.2.2-3.3.el7.x86_64.rpm"
#---------- Remove Old Packages if exist ----------
sudo yum remove -y \
    docker \
    docker-client \
    docker-client-latest \
    docker-common \
    docker-latest \
    docker-latest-logrotate \
    docker-logrotate \
    docker-engine

#---------- Installation ----------
sudo yum install -y yum-utils
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

sudo yum install ${CONTAINERD}

sudo yum install docker-ce-${DOCKER_CE_VERSION} docker-ce-cli

#---------- Customization -----------
sudo mkdir /etc/docker

sudo bash -c 'cat <<EOF > /etc/docker/daemon.json
{
    "data-root": "/opt/docker"
}
EOF'
