# Shiny Floating License Server

## Usage

1. Add your floating license key to `.key` file in the root folder, like so: `echo "MY-FLOATING-KEY" > ".key"`
2. Adjust [configuration](https://wyday.com/limelm/help/turbofloat-server/#config) in `ssp-license-server.conf` as needed. 
2. Build the Docker image: `bash build.sh`
3. Run the container: `bash run.sh`

This should activate your floating license server with your key. The running server is available on port 8979 by default.

### Deactivate
In order to deactivate a Floating License Server, you must deactivate it from the same server it's currently activated on - ie. the _same_ Docker container.
Edit the run-server.sh script and uncomment the "deactivate-license.sh" script, and run run-server.sh again.