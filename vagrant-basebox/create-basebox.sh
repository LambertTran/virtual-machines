#!/bin/bash -ex

vagrant up

BASEBOX_NAME=$(VBoxManage list vms | grep base | awk '{print $1}' | cut -d "\"" -f2)

vagrant package --base ${BASEBOX_NAME}

vagrant box add base-ubuntu1804 -f ./package.box
