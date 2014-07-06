#!/bin/bash

IMAGE_ID=$(docker ps -a | grep "springxd-singlenode" | cut -f1 -d' ')
[ -z "$IMAGE_ID" ] || docker stop $IMAGE_ID | xargs docker rm | echo "Removed $IMAGE_ID"

docker run --name=springxd-singlenode -p 5555:5555 -p 9393:9393 -d -t $USER/springxd:1.0.0.M7 /spring-xd-1.0.0.M7/xd/bin/xd-singlenode

IP=`echo $(ifconfig eth0 | awk -F: '/inet addr:/ {print $2}' | awk '{ print $1 }')`
URL="http://$IP:9393"
ADMIN_URL="http://$IP:9393/admin-ui"

echo "Waiting for Spring XD Single Node to respond."
until $(curl --output /dev/null --silent --head --fail $URL); do
    printf '.'
    sleep 5
done

echo ""
echo "Spring XD web application URL: $ADMIN_URL"
echo ""
