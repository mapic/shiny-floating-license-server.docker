#!/bin/bash

# build
docker build -t mapic/shiny-floating-license-server .

# verify
if [ "$?" -gt "0" ]; then
    echo "Build errored."
    exit 1
fi

# push
docker push mapic/shiny-floating-license-server:latest