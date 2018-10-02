FROM ubuntu:16.04

LABEL maintainer="knutole@mapic.io"
LABEL repository="https://github.com/mapic/shiny-floating-license-server.docker"

# install deps
RUN apt-get update -y
RUN apt-get install -y sudo software-properties-common apt-transport-https fish git wget curl htop nano net-tools iputils-ping
RUN apt-get upgrade -y

# download rstudio shiny floating license server
RUN wget https://s3.amazonaws.com/rstudio-license-server/ssp-license-server-1.0.9-x86_64.deb

# install packacge
RUN yes N | sudo dpkg -i ssp-license-server-1.0.9-x86_64.deb

# add config
ADD ./ssp-license-server.conf /etc/

# add scripts
ADD ./sh/activate-license.sh /home/
ADD ./sh/deactivate-license.sh /home/
ADD ./sh/check-license.sh /home/
ADD ./sh/start-license-server.sh /home/
ADD ./sh/stop-license-server.sh /home/

# set workdir
WORKDIR /home/

# port
EXPOSE 8979