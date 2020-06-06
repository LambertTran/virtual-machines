#!/bin/bash

sudo yum install -y chrony

systemctl enable chronyd

#-------------- Config ---------------
cat <<EOF | sudo tee /etc/chrony.conf
server 0.rhel.pool.ntp.org iburst
server 1.rhel.pool.ntp.org iburst
server 2.rhel.pool.ntp.org iburst
server 3.rhel.pool.ntp.org iburst

stratumweight 0
driftfile /var/lib/chrony/drift
makestep 10 3
logdir /var/log/chrony
EOF

sudo systemctl restart chronyd

sudo chronyc makestep

sudo timedatectl set-timezone America/Los_Angeles
