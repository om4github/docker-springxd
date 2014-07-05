#!/bin/bash

IMAGE_ID=$(docker ps -a | grep "springxd-singlenode" | cut -f1 -d' ')
[ -z "$IMAGE_ID" ] || docker stop $IMAGE_ID | xargs docker rm | echo "Removed $IMAGE_ID"

docker run --name=springxd-singlenode -p 9393:9393 -d -t $USER/springxd:1.0.0.M7 /spring-xd-1.0.0.M7/xd/bin/xd-singlenode
