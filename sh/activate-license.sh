#!/bin/bash

if [ -z "$SHINY_FLOATING_LICENSE_SERVER_KEY" ]; then
    echo "No license key. Quitting!"
    exit 1
fi

# activate license
sudo /usr/lib/ssp-license-server/bin/license-server -a="$SHINY_FLOATING_LICENSE_SERVER_KEY" -pdets=/usr/lib/ssp-license-server/bin/license-server.dat -config=/etc/ssp-license-server.conf
