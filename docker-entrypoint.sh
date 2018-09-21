#!/bin/bash

if [ -z "$SHINY_FLOATING_LICENSE_SERVER_KEY" ]; then
    echo "No license key. Quitting!"
    exit 1
fi


# # activate license
# sudo /usr/lib/ssp-license-server/bin/license-server -a="$SHINY_FLOATING_LICENSE_SERVER_KEY" -pdets=/usr/lib/ssp-license-server/bin/license-server.dat -config=/etc/ssp-license-server.conf

# # deactivate license
# sudo /usr/lib/ssp-license-server/bin/license-server -deact -pdets=/usr/lib/ssp-license-server/bin/license-server.dat -config=/etc/ssp-license-server.conf

# # get status
# sudo /usr/lib/ssp-license-server/bin/license-server -v -pdets=/usr/lib/ssp-license-server/bin/license-server.dat -config=/etc/ssp-license-server.conf

# # start floating license server
# sudo /usr/lib/ssp-license-server/bin/license-server -x -pdets=/usr/lib/ssp-license-server/bin/license-server.dat -config=/etc/ssp-license-server.conf -pidfile=/var/run/ssp-license-server.pid
