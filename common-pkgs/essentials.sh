#!/bin/bash -ex

echo "======== Installing Essential Packages ============ "
sudo yum update -y
sudo yum install -y \
    vim \
    python3 \
    python3-pip \
    curl \
    git \
    bind-utils \
    telnet

echo "======== Installing Essential Pip Packages ============ "
sudo pip3 install \
    awscli \
    docker-compose==1.25.4
