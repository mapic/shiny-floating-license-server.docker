#!/bin/bash

# ensure docker container is running
DOCKER_CONTAINER_NAME="shiny-floating-license-server"
docker start $DOCKER_CONTAINER_NAME

# stop license server
docker exec -it "$DOCKER_CONTAINER_NAME" bash /home/stop-license-server.sh

# deactivate license
docker exec -it "$DOCKER_CONTAINER_NAME" bash /home/deactivate-license.sh

# stop docker container
CID=$(docker ps -q -f "name=$DOCKER_CONTAINER_NAME")

# remove container
docker kill "$DOCKER_CONTAINER_NAME"

# clear namespace and save copy
docker rename "$DOCKER_CONTAINER_NAME" "$DOCKER_CONTAINER_NAME-$CID"
