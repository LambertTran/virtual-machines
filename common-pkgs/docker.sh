#!/bin/bash

#---------- Version ----------
DOCKER_CE_VERSION="5:19.03.7~3-0~ubuntu-bionic"

sudo apt-get remove -y docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get install -y \
    apt-transport-https ca-certificates curl gnupg-agent software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update

sudo apt-get install -y docker-ce=${DOCKER_CE_VERSION} docker-ce-cli containerd.io

sudo docker --version

sudo groupadd docker
