#!/bin/bash

# start floating license server
sudo /usr/lib/ssp-license-server/bin/license-server -d -pdets=/usr/lib/ssp-license-server/bin/license-server.dat -config=/etc/ssp-license-server.conf -pidfile=/var/run/ssp-license-server.pid

# check exit status
EXITCODE=$?
if [ $EXITCODE -gt 0 ]; then
    echo "Something went wrong. Quitting!"
fi