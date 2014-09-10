#!/bin/bash

#Update apt
apt-get update

#Install docker
DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes docker.io

#Create symlink
ln -sf /usr/bin/docker.io /usr/local/bin/docker

#Run shipyard
docker run -i -t -v /var/run/docker.sock:/docker.sock shipyard/deploy setup