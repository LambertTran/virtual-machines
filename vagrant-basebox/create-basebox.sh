#!/bin/bash -ex
BASE_BOX_VERSION="base-centos7-1.0"

vagrant plugin install vagrant-vbguest

vagrant up

BASEBOX_NAME=$(VBoxManage list vms | grep base | awk '{print $1}' | cut -d "\"" -f2)

vagrant package --base ${BASEBOX_NAME}

vagrant box add ${BASE_BOX_VERSION} ./package.box

vagrant destroy
