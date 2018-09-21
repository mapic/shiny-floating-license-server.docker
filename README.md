# Shiny Floating License Server

### Install

1. Add your floating license key to `.key` file in the root folder, like so: `echo "MY-FLOATING-KEY" > ".key"`
2. Adjust [configuration](https://wyday.com/limelm/help/turbofloat-server/#config) in `ssp-license-server.conf` as needed. 
2. Build the Docker image: `bash build.sh`


### Start license server

Start the license server with `bash start-server.sh`

This should activate your floating license server with your key. The running server is available on port 8979 by default.


### Stop license server and deactivate key

Stop the license server with `bash stop-server.sh`
