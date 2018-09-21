#!/bin/bash


# check for floating license key
SHINY_FLOATING_LICENSE_SERVER_KEY=$(cat .key 2> /dev/null)
if [ "$SHINY_FLOATING_LICENSE_SERVER_KEY" == "" ]; then
    echo "No license key found. Quitting!"
    exit 1
fi
export SHINY_FLOATING_LICENSE_SERVER_KEY=$SHINY_FLOATING_LICENSE_SERVER_KEY

# check for already running container
CID=""
DOTCID=$(cat .cid 2> /dev/null)
if [ "$DOTCID" != "" ]; then
    CID=$(docker ps -aq --no-trunc | grep $DOTCID)
    RUNNINGCID=$(docker ps -q --no-trunc | grep $DOTCID)
fi
if [ "$CID" == "" ]; then
    
    echo "Starting container..."
    CID=$(docker run -t -d -e SHINY_FLOATING_LICENSE_SERVER_KEY=$SHINY_FLOATING_LICENSE_SERVER_KEY mapic/shiny-floating-license-server:latest bash)
    EXITCODE=$?

    if [ $EXITCODE -gt 0 ]; then
        echo "Something went wrong. Quitting!"
    else 
        # save container id to file
        echo "$CID" > ".cid"
    fi
else 
    echo "Using existing container"
    if [ "$RUNNINGCID" = "" ]; then
        # we have a non-running container we need to start
        docker start $CID
    fi
fi

# now we have a running container, either new or previous one

# activate license
echo "Activating license..."
docker exec -it -e SHINY_FLOATING_LICENSE_SERVER_KEY=$SHINY_FLOATING_LICENSE_SERVER_KEY $CID bash /home/activate-license.sh

# start license server
echo "Starting license server..."
docker exec -it $CID bash /home/start-license-server.sh

# check license
# docker exec -it $CID bash /home/check-license.sh

# deactivate license
# docker exec -it $CID bash /home/deactivate-license.sh