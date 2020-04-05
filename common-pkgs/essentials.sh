#!/bin/bash -ex

echo "======== Installing Essential Packages ============ "
sudo apt-get update
sudo apt-get install -y vim \
    aptitude \
    python3 \
    python3-pip \
    curl \
    dnsutils \
    telnet \
    git

sudo pip3 install awscli

sudo apt-get update
sudo apt-get install -y \
     dnsutils iputils-ping telnet aptitude git python3-pip
