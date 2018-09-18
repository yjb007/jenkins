#!/bin/bash

set -ex

export SERVICE_NAME='pilipa-inside-jenkins'
export IMAGE_NAME='jenkins/yujianbo:latest'

docker service rm pilipa-inside-git
sleep 2

docker service create --name "$SERVICE_NAME" --network my-network --replicas 1 \
  --mount type=bind,src=/srv/volume/jenkins,dst=/var/jenkins_home \
  --publish "mode=host,published=8080,target=8080" \
  --publish "mode=host,published=50000,target=50000" \
"$IMAGE_NAME"

