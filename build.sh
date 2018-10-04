#!/bin/bash
docker build -t mapic/shiny-floating-license-server .

docker push mapic/shiny-floating-license-server:latest