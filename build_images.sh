#!/bin/bash

#echo "Removing Zookeeper UI image"
#docker rmi $USER/zookeeper-ui 2>/dev/null

echo "Building Zookeeper UI image"
pushd zookeeper-ui
docker build --rm=true -t $USER/zookeeper-ui .
popd

#echo "Removing Spring XD image"
#docker rmi $USER/springxd:1.0.0.M7 2>/dev/null

echo "Build Spring XD image"
pushd springxd
docker build --rm=true -t $USER/springxd:1.0.0.M7 .
popd
