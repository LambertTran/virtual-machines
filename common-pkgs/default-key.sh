#!/bin/bash

PUBLIC_KEY="ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHzW7NBs3dzfbR6fVbv4fvxLfn5IHa0KmZwaHYt5MMUi"

echo ${PUBLIC_KEY} >> /home/vagrant/.ssh/authorized_keys
