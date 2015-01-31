#!/bin/bash

IMAGE_ID=$(docker ps -a | grep "springxd-bash" | cut -f1 -d' ')
[ -z "$IMAGE_ID" ] || docker stop $IMAGE_ID | xargs docker rm | echo "Removed $IMAGE_ID"

IP=`echo $(ifconfig eth0 | awk -F: '/inet addr:/ {print $2}' | awk '{ print $1 }')`

URL="http://$IP:9393/"

echo "Waiting for Spring XD Single Node to respond."
until $(curl --output /dev/null --silent --head --fail $URL); do
    printf '.'
    sleep 5
done

echo ""
echo "HOST IP: $IP"
echo ""
docker run --name=springxd-bash -i -t om4github/spring-xd-1.1.0.RC1-dist /bin/bash
