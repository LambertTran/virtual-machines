#!/bin/bash -ex

#---------- Version ----------
DOCKER_CE="3:docker-ce-19.03.9-3.el7.x86_64"
CONTANERD="containerd.io-1.2.13-3.2.el7"
#CONTAINERD="https://download.docker.com/linux/centos/7/x86_64/stable/Packages/containerd.io-1.2.2-3.3.el7.x86_64.rpm"

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

#sudo yum install -y ${CONTAINERD}

sudo yum install -y ${DOCKER_CE} docker-ce-cli ${CONTANERD}

#---------- Customization -----------
sudo mkdir /etc/docker || true

cat <<EOF | sudo tee /etc/docker/daemon.json
{
    "data-root": "/opt/docker",
    "log-driver": "json-file",
    "log-opts": {
        "max-size": "10m",
        "max-file": "3",
        "tag": "container_name/{{.Name}}",
        "labels": "${ENV_NAME}"
    }
}
EOF

sudo systemctl enable docker

sudo systemctl start docker

sudo docker ps -a

#----------------- Add users to docker groups --------------
users=(centos vagrant)
for u in ${users[@]}; do
    id -u $u && sudo usermod -aG docker $u
done
