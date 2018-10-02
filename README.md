# Shiny Floating License Server

Please see https://github.com/mapic/shiny.docker-compose for usage instructions.

## Install
```bash
git clone https://github.com/mapic/docker.shiny-floating-license-server.git
cd docker.shiny-floating-license-server
```

## Configure

1. Add your floating license key to `.key` file in the root folder, like so: 
```bash 
echo "MY-FLOATING-KEY" > ".key"
```
2. Adjust [configuration](https://wyday.com/limelm/help/turbofloat-server/#config) in `ssp-license-server.conf` as needed. (Note that if you change the `port`, the port must be `EXPOSE`d in the [Dockerfile](https://github.com/mapic/docker.shiny-floating-license-server/blob/master/Dockerfile#L31))
2. Build the Docker image: 
```bash
bash build.sh
```


## Start license server and activate key

Start the license server: 
```bash
bash start-server.sh
```

This should activate your floating license server with your key. The running server is available on port 8979 by default.


## Stop license server and deactivate key

Stop the license server:
```bash
bash stop-server.sh
```

## Networking

The start-server.sh script will automatically create a Docker Bridge network called `shiny-network`. You can use this network in your Docker Compose or other configuration to access the floating license container. 

You can therefore access the container at `shiny-floating-license-server:8979` from any other container connected to the `shiny-network` Docker network.
