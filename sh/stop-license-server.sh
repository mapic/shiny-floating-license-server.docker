#!/bin/bash
PID=$(cat /var/run/ssp-license-server.pid)
kill $PID