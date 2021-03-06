#!/bin/bash

DOCKER_CONTAINER_NAME=shiny-floating-license-server
DOCKER_CONTAINER_NETWORK=shiny-network


# check for floating license key
SHINY_FLOATING_LICENSE_SERVER_KEY=$(cat .key 2> /dev/null)
export SHINY_FLOATING_LICENSE_SERVER_KEY=$SHINY_FLOATING_LICENSE_SERVER_KEY
if [ "$SHINY_FLOATING_LICENSE_SERVER_KEY" == "" ]; then
    echo "No license key found. Quitting!"
    exit 1
fi

# ensure docker container is running
docker run --restart unless-stopped --name $DOCKER_CONTAINER_NAME -t -d mapic/shiny-floating-license-server:latest bash 2> /dev/null
EXITCODE=$?
if [ $EXITCODE -gt 0 ]; then
    docker start $DOCKER_CONTAINER_NAME
fi

# activate license
echo "Activating license..."
docker exec -it -e SHINY_FLOATING_LICENSE_SERVER_KEY=$SHINY_FLOATING_LICENSE_SERVER_KEY $DOCKER_CONTAINER_NAME bash /home/activate-license.sh

# start license server
echo "Starting license server..."
docker exec -d $DOCKER_CONTAINER_NAME bash /home/start-license-server.sh

# create docker network
echo "Creating Docker network..."
docker network create -d bridge $DOCKER_CONTAINER_NETWORK

# attach to docker network
echo "Connecting to network..."
docker network connect $DOCKER_CONTAINER_NETWORK $DOCKER_CONTAINER_NAME
