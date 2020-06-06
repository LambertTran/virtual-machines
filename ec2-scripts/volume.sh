#!/bin/bash -ex

lsblk

sudo mkdir /opt/lb
sudo chown -R centos:centos /opt/lb

sudo mkfs -t ext4 /dev/xvdb

echo "/dev/xvdb /opt/lb ext4    defaults,nofail 0   0" | sudo tee -a /etc/fstab

sudo mount -a

df -h
