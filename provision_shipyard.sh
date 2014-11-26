#!/bin/bash

#Update apt
apt-get update

#Install docker
DEBIAN_FRONTEND=noninteractive 
apt-get install -y --force-yes docker.io wget

#Create symlink
ln -sf /usr/bin/docker.io /usr/local/bin/docker

#Launch RethindDB
docker run -d -P --name rethinkdb shipyard/rethinkdb

#Launch Shipyard
docker run -d -p 8080:8080 --link rethinkdb:rethinkdb shipyard/shipyard
