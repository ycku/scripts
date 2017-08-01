#!/bin/bash
# Please check out the details of official page: https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/
# This script need to sudo.
# Testing on Ubuntu Zesty 17.04 amd64

# Uninstall old versions
apt-get remove docker docker-engine docker.io

# Install using the repository
apt-get update
apt-get install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
apt-key fingerprint 0EBFCD88
# pub   4096R/0EBFCD88 2017-02-22
#       Key fingerprint = 9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88
# uid                  Docker Release (CE deb) <docker@docker.com>
# sub   4096R/F273FCD8 2017-02-22
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get install docker-ce

docker run hello-world
# You should see the messages of Hello World in the end.
