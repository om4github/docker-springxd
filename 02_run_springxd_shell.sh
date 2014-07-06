#!/bin/bash

IMAGE_ID=$(docker ps -a | grep "springxd-shell" | cut -f1 -d' ')
[ -z "$IMAGE_ID" ] || docker stop $IMAGE_ID | xargs docker rm | echo "Removed $IMAGE_ID"

IP=`echo $(ifconfig eth0 | awk -F: '/inet addr:/ {print $2}' | awk '{ print $1 }')`

URL="http://$IP:9393/"

echo ""
echo "Connect to the Spring XD Single Node using 'admin config server http://$IP:9393'"
echo ""
docker run --name=springxd-shell -i -t $USER/springxd:1.0.0.M7 /spring-xd-1.0.0.M7/shell/bin/xd-shell
