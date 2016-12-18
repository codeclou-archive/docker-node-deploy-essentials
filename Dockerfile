FROM ubuntu:16.04

#
# PACKAGES
#
RUN apt-get update && apt-get install -y sudo && rm -rf /var/lib/apt/lists/* && \
    sudo apt-get update && \
    sudo apt-get -y install apt-utils wget curl bzip2 build-essential zlib1g-dev


#
# NODE
#
RUN wget -O /opt/node-v7.2.1-linux-x64.tar.xz https://nodejs.org/dist/v7.2.1/node-v7.2.1-linux-x64.tar.xz && \
    tar xfv /opt/node-v7.2.1-linux-x64.tar.xz -C /opt && \
    export PATH=$PATH:/opt/node-v7.2.1-linux-x64/bin && \
    npm install -g node-deploy-essentials

ENV PATH $PATH:/opt/node-v7.2.1-linux-x64/bin

#
# WORKDIR
#
RUN mkdir /opt/npm/
WORKDIR /opt/npm/

CMD ndes --version
