#!/bin/bash

#Update apt
apt-get update

#Install docker
DEBIAN_FRONTEND=noninteractive 
apt-get install -y --force-yes docker.io wget

#Create symlink
ln -sf /usr/bin/docker.io /usr/local/bin/docker

#Open up API
echo 'DOCKER_OPTS="-H tcp://0.0.0.0:4500 -H unix:///var/run/docker.sock"' >> /etc/default/docker.io

#Restart docker
service docker.io restart
