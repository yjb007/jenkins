#!/bin/bash

set -ex

export IMAGE_NAME=jenkins/yujianbo
docker build --no-cache --pull -t $IMAGE_NAME ./

