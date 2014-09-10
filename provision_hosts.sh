#!/bin/bash

#Update apt
apt-get update

#Install docker
DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes docker.io wget

#Create symlink
ln -sf /usr/bin/docker.io /usr/local/bin/docker

#Set
echo 'DOCKER_OPTS="-H tcp://127.0.0.1:4500 -H unix:///var/run/docker.sock"' >> /etc/default/docker.io

#Run agent
docker run -i -t -v /var/run/docker.sock:/docker.sock \
  -e IP=`ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{print $1;}'` \
  -e URL=http://10.245.1.2:8000 -p 4500:4500 shipyard/agent
